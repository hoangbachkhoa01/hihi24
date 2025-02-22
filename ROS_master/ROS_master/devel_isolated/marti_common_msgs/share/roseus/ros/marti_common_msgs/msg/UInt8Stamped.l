;; Auto-generated. Do not edit!


(when (boundp 'marti_common_msgs::UInt8Stamped)
  (if (not (find-package "MARTI_COMMON_MSGS"))
    (make-package "MARTI_COMMON_MSGS"))
  (shadow 'UInt8Stamped (find-package "MARTI_COMMON_MSGS")))
(unless (find-package "MARTI_COMMON_MSGS::UINT8STAMPED")
  (make-package "MARTI_COMMON_MSGS::UINT8STAMPED"))

(in-package "ROS")
;;//! \htmlinclude UInt8Stamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass marti_common_msgs::UInt8Stamped
  :super ros::object
  :slots (_header _value ))

(defmethod marti_common_msgs::UInt8Stamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _value (round __value))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _value
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _value
       (write-byte _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _value
     (setq _value (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get marti_common_msgs::UInt8Stamped :md5sum-) "90539346f3c3c8fc47f159ab9a6ff208")
(setf (get marti_common_msgs::UInt8Stamped :datatype-) "marti_common_msgs/UInt8Stamped")
(setf (get marti_common_msgs::UInt8Stamped :definition-)
      "std_msgs/Header header

uint8 value

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :marti_common_msgs/UInt8Stamped "90539346f3c3c8fc47f159ab9a6ff208")


