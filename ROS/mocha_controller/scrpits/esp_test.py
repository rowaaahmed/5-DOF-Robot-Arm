#!/usr/bin/env python3
import rospy
import socket
from std_msgs.msg import String

ESP32_IP = '192.168.4.1'  # 🛜 Replace with your ESP32 IP address
PORT = 1234

def led_control_callback(msg):
    try:
        cmd = msg.data
        if cmd not in ['0', '1']:
            rospy.logwarn("Invalid LED command received: %s", cmd)
            return

        # Create TCP socket
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((ESP32_IP, PORT))
            s.sendall(cmd.encode())
            rospy.loginfo("Sent command '%s' to ESP32", cmd)

    except Exception as e:
        rospy.logerr("Failed to send command: %s", str(e))

def main():
    rospy.init_node('led_tcp_sender')
    rospy.Subscriber('/led_control', String, led_control_callback)
    rospy.loginfo("LED TCP Sender Node Started")
    rospy.spin()

if __name__ == '__main__':
    main()