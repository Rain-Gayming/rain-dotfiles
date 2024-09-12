use vulkano::VulkanLibrary;
use vulkano::instance::{Instance, InstanceCreateInfo};

use vulkano::device::QueueFlags;
use vulkano::device::{Device, DeviceCreateInfo, QueueCreateInfo};

fn main() {

    //initialises vulkan/vulkano
    let library = VulkanLibrary::new().expect("no local Vulkan library/DLL");
    let instance = Instance::new(library, InstanceCreateInfo::default())
        .expect("failed to create instance");
    
    //loops through all devices
    //returns ones able to use vulkan
    let physical_device = instance
        .enumerate_physical_devices()
        .expect("could not enumerate devices")
        .next()
        .expect("no devices available");
    
    //finds a queue on the GPU
    let queue_family_index = physical_device
        .queue_family_properties()
        .iter()
        .enumerate()
        .position(|(_queue_family_index, queue_family_properties)| {
            queue_family_properties.queue_flags.contains(QueueFlags::GRAPHICS)
        })
        .expect("couldn't find a graphical queue family");

    //create the device on the queue
    let (device, mut queues) = Device::new(
        physical_device,
        DeviceCreateInfo{
            //input the queue families and their index
            queue_create_infos: vec![QueueCreateInfo{
                queue_family_index: queue_family_index.try_into().unwrap(),
                ..Default::default()
            }],
            ..Default::default()
        }
    )
    .expect("failed to create device");

    let queue = queues.next().unwrap();
}


