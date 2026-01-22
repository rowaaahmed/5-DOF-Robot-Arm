#!/usr/bin/env python3
import socket
import rospy
from sensor_msgs.msg import JointState

ESP32_IP = '192.168.4.1'
PORT = 1234

# List of joints to send (in the order the ESP32 expects them)
JOINT_NAMES = ["waist_joint", "lower_arm_joint", "upper_arm_joint","wrist_joint","gripper_base_joint","left_gear_joint"]

def joint_callback(msg):
    try:
        angles_deg = []
        for joint_name in JOINT_NAMES:
            if joint_name in msg.name:
                idx = msg.name.index(joint_name)
                angle_rad = msg.position[idx]
                angle_deg = int(angle_rad * 180.0 / 3.14159)
                angles_deg.append(str(angle_deg))
            else:
                rospy.logwarn("Joint '%s' not found", joint_name)
                angles_deg.append("0")  # fallback default

        # Join all angles into one string, comma-separated
        data_to_send = ",".join(angles_deg)

        # Send over socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((ESP32_IP, PORT))
        s.sendall((data_to_send + "\n").encode())
        s.close()

        rospy.loginfo("Sent angles to ESP32: %s", data_to_send)

    except Exception as e:
        rospy.logerr(f"Failed to send joint data: {e}")

rospy.init_node('multi_joint_angle_sender')
rospy.Subscriber('/mocha/joint_states', JointState, joint_callback)
rospy.spin()