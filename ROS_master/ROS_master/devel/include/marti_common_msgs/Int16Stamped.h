// Generated by gencpp from file marti_common_msgs/Int16Stamped.msg
// DO NOT EDIT!


#ifndef MARTI_COMMON_MSGS_MESSAGE_INT16STAMPED_H
#define MARTI_COMMON_MSGS_MESSAGE_INT16STAMPED_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace marti_common_msgs
{
template <class ContainerAllocator>
struct Int16Stamped_
{
  typedef Int16Stamped_<ContainerAllocator> Type;

  Int16Stamped_()
    : header()
    , value(0)  {
    }
  Int16Stamped_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , value(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int16_t _value_type;
  _value_type value;





  typedef boost::shared_ptr< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> const> ConstPtr;

}; // struct Int16Stamped_

typedef ::marti_common_msgs::Int16Stamped_<std::allocator<void> > Int16Stamped;

typedef boost::shared_ptr< ::marti_common_msgs::Int16Stamped > Int16StampedPtr;
typedef boost::shared_ptr< ::marti_common_msgs::Int16Stamped const> Int16StampedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::marti_common_msgs::Int16Stamped_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::marti_common_msgs::Int16Stamped_<ContainerAllocator1> & lhs, const ::marti_common_msgs::Int16Stamped_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.value == rhs.value;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::marti_common_msgs::Int16Stamped_<ContainerAllocator1> & lhs, const ::marti_common_msgs::Int16Stamped_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace marti_common_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1df4bae6d493b0cc189b572aeab3b8a1";
  }

  static const char* value(const ::marti_common_msgs::Int16Stamped_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1df4bae6d493b0ccULL;
  static const uint64_t static_value2 = 0x189b572aeab3b8a1ULL;
};

template<class ContainerAllocator>
struct DataType< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "marti_common_msgs/Int16Stamped";
  }

  static const char* value(const ::marti_common_msgs::Int16Stamped_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n"
"\n"
"int16 value\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::marti_common_msgs::Int16Stamped_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.value);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Int16Stamped_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::marti_common_msgs::Int16Stamped_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::marti_common_msgs::Int16Stamped_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "value: ";
    Printer<int16_t>::stream(s, indent + "  ", v.value);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MARTI_COMMON_MSGS_MESSAGE_INT16STAMPED_H