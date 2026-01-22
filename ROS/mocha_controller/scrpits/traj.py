#!/usr/bin/env python3

import rospy
import tf
import sys
import moveit_commander
import moveit_msgs.msg
from geometry_msgs.msg import Pose
from math import pi
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list

from interactive_markers.interactive_marker_server import *
from interactive_markers.menu_handler import *
from visualization_msgs.msg import Marker, MarkerArray , InteractiveMarkerControl

# Global lists and objects
viapoints = []
viapoints_marker = MarkerArray()

def processFeedback(feedback):
    rospy.loginfo(f"Received menu entry {feedback.menu_entry_id}")

    if feedback.event_type == InteractiveMarkerFeedback.MENU_SELECT:
        if feedback.menu_entry_id == 1:
            group.set_pose_target(feedback.pose)
            plan = group.go(wait=True)
            group.stop()
            group.clear_pose_targets()

        elif feedback.menu_entry_id == 2:
            try:
                listener.waitForTransform(EE_LINK, BASE_LINK, rospy.Time(), rospy.Duration(1.0))
                (trans, rot) = listener.lookupTransform(BASE_LINK, EE_LINK, rospy.Time())
            except (tf.Exception, tf.LookupException, tf.ConnectivityException):
                rospy.logerr("TF lookup failed between %s and %s", BASE_LINK, EE_LINK)
                return

            feedback.pose.position.x = trans[0]
            feedback.pose.position.y = trans[1]
            feedback.pose.position.z = trans[2]
            feedback.pose.orientation.x = rot[0]
            feedback.pose.orientation.y = rot[1]
            feedback.pose.orientation.z = rot[2]
            feedback.pose.orientation.w = rot[3]
            server.setPose(feedback.marker_name, feedback.pose)

        elif feedback.menu_entry_id == 4:
            viapoints.append(feedback.pose)
            rospy.loginfo(f"Added via point #{len(viapoints)}")
            marker = Marker()
            marker.header.frame_id = BASE_LINK
            marker.type = Marker.SPHERE
            marker.action = Marker.ADD
            marker.scale.x = marker.scale.y = marker.scale.z = 0.005
            marker.color.r = marker.color.g = 1.0
            marker.color.b = 0.0
            marker.color.a = 1.0
            marker.pose = feedback.pose
            viapoints_marker.markers.append(marker)
            for idx, m in enumerate(viapoints_marker.markers):
                m.id = idx
            marker_pub.publish(viapoints_marker)

        elif feedback.menu_entry_id == 5:
            if viapoints:
                pose_list = [Pose(p.position, p.orientation) for p in viapoints]
                (plan, fraction) = group.compute_cartesian_path(pose_list, 0.001, 0)
                rospy.loginfo(f"Planned path fraction: {fraction:.2f}")
                display_traj = moveit_msgs.msg.DisplayTrajectory()
                display_traj.trajectory_start = robot.get_current_state()
                display_traj.trajectory.append(plan)
                display_traj_pub.publish(display_traj)
                success = group.go(wait=True)
                rospy.loginfo(f"Motion execution success: {success}")
                group.execute(plan, wait=True)

        elif feedback.menu_entry_id == 6:
            if viapoints_marker.markers:
                viapoints.clear()
                for m in viapoints_marker.markers:
                    m.action = Marker.DELETE
                marker_pub.publish(viapoints_marker)
                rospy.loginfo("Cleared all via-points")
            else:
                rospy.loginfo("No via-points to clear")

    server.applyChanges()

if __name__ == "__main__":
    rospy.init_node("simple_marker")

    ### === EDIT HERE ===
    GROUP_NAME = "arm"              # Your MoveIt group
    BASE_LINK = "base_link"         # Your robot's base link
    EE_LINK = "gripper_base"        # Your robot's end effector link
    ### =================

    moveit_commander.roscpp_initialize(sys.argv)
    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    group = moveit_commander.MoveGroupCommander(GROUP_NAME)
    listener = tf.TransformListener()

    display_traj_pub = rospy.Publisher('/move_group/display_planned_path', moveit_msgs.msg.DisplayTrajectory, queue_size=20)
    marker_pub = rospy.Publisher('/via_points', MarkerArray, queue_size=20)
    server = InteractiveMarkerServer("simple_marker")

    # Initialize interactive marker
    int_marker = InteractiveMarker()
    int_marker.header.frame_id = BASE_LINK
    int_marker.name = "my_marker"
    int_marker.description = "Simple Control"
    int_marker.scale = 0.05

    try:
        listener.waitForTransform(EE_LINK, BASE_LINK, rospy.Time(), rospy.Duration(1.0))
        (trans, rot) = listener.lookupTransform(BASE_LINK, EE_LINK, rospy.Time())
    except (tf.Exception, tf.LookupException, tf.ConnectivityException):
        rospy.logerr("TF lookup failed between %s and %s", BASE_LINK, EE_LINK)
        sys.exit(1)

    int_marker.pose.position.x = trans[0]
    int_marker.pose.position.y = trans[1]
    int_marker.pose.position.z = trans[2]
    int_marker.pose.orientation.x = rot[0]
    int_marker.pose.orientation.y = rot[1]
    int_marker.pose.orientation.z = rot[2]
    int_marker.pose.orientation.w = rot[3]

    marker = Marker()
    marker.type = Marker.SPHERE
    marker.scale.x = marker.scale.y = marker.scale.z = 0.01
    marker.color.r = 1.0
    marker.color.g = 0.0
    marker.color.b = 0.0
    marker.color.a = 1.0

    rotate_control = InteractiveMarkerControl()
    rotate_control.orientation.w = 1
    rotate_control.orientation.x = 0
    rotate_control.orientation.y = 1
    rotate_control.orientation.z = 0
    rotate_control.name = "move_xy"
    rotate_control.interaction_mode = InteractiveMarkerControl.MOVE_PLANE
    rotate_control.always_visible = True
    rotate_control.markers.append(marker)

    int_marker.controls.append(rotate_control)
    server.insert(int_marker, processFeedback)

    menu_handler = MenuHandler()
    menu_handler.insert("Execute Motion", callback=processFeedback)
    menu_handler.insert("Move to end-effector pose", callback=processFeedback)
    via_menu = menu_handler.insert("Via Points")
    menu_handler.insert("Add via-point", parent=via_menu, callback=processFeedback)
    menu_handler.insert("Execute Trajectory", parent=via_menu, callback=processFeedback)
    menu_handler.insert("Reset via-points", parent=via_menu, callback=processFeedback)

    menu_handler.apply(server, int_marker.name)
    server.applyChanges()

    rospy.spin()