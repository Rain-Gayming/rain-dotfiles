use std::sync::Arc;

use shaders::*;

use vulkano::pipeline::compute;
use vulkano::VulkanLibrary;
use vulkano::instance::{Instance, InstanceCreateInfo};

//devices
use vulkano::device::QueueFlags;
use vulkano::device::{Device, DeviceCreateInfo, QueueCreateInfo};

//memory
use vulkano::memory::allocator::StandardMemoryAllocator;
use vulkano::buffer::{Buffer, BufferCreateInfo, BufferUsage};
use vulkano::memory::allocator::{AllocationCreateInfo, MemoryTypeFilter};


mod shaders;

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

    //makes the queue readable
    let queue = queues.next().unwrap();

    //creates a memory allocator
    let memory_allocator = Arc::new(StandardMemoryAllocator::new_default(device.clone()));

    //creates a memory buffer
    let data: i32 = 12;
    let buffer = Buffer::from_data(
        memory_allocator.clone(),
        BufferCreateInfo{
            usage: BufferUsage::UNIFORM_BUFFER,
            ..Default::default()
        },
        AllocationCreateInfo{
            memory_type_filter: MemoryTypeFilter::PREFER_DEVICE
                | MemoryTypeFilter::HOST_SEQUENTIAL_WRITE,
                ..Default::default()
        },
        data,
    )
    .expect("failed to create buffer");

    
    //loads the shader
    //let shader = shaders::compute_shader::load(device.clone()).expect("failed to create shader module");
}

