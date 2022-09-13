import UIKit
import Foundation

/*

 * Swift has built-in support for writing asynchronous and parallel code in structured way.
 * Asynchronous code can be suspended and resumed later, although only one piece of the program executes at a time.
 * Parallel code means multiple pieces of code run simultaneously on separate system resources(processors)

 */

/// GCD

/*  - FIFO Order
    
    - Concurrenct: It’s starting multiple tasks at the same time but not guarantee for the finish at same time. Its can finish any order.
    
    - Serial: It’s executing one task at a time.
    
    - Sync vs Async:
        
        Sync:-  When a work item is executed synchronously with the sync method, the program waits until execution     finishes before the method call returns.
        
        Async:- Execute asynchronously with the async method, the method call      returns immediately.
    
    - Global Queue: Used to perform non-UI work in the background.
    
    - Main Queue: Used to update the UI after completing work in a task on a concurrent queue.
 
    - Dispatch Queue Priority: (QoS: Quality of Service)
 
         * .userInteractive (Most priority given)
         * .userInitiated
         * .default
         * .utility
         * .background
         * .unspecified (Least priority given)
 
    - DispatchGroups:
 
        *   Dispatch groups allow us to monitor a group of tasks as a single unit. It aggregates a set of tasks and synchronizes behaviors in the group.
        
        *   We add tasks to a group by making balanced calls to enter() and leave(). When all tasks finish executing, the group executes its completion handler. You can also wait synchronously for all tasks in the group to finish executing.
 
    - Methods:
    
        *   enter(): By calling enter, we are saying the DispatchGroup that an async task has began.
        
        *   leave(): leave means that an async task has ended.
 
        *   notify(queue:): we can use notify to configure a closure that will be executed once all the tasks that entered into the DispatchGroup have already left it. There is also a synchronous version of notify that is called wait(timeout:), which blocks the current thread until all the tasks that entered into the DispatchGroup have left it.
 
        
 */
        // DispatchQueue with QoS
        DispatchQueue.global(qos: .background).async {
            // call your background task here
            DispatchQueue.main.async {
                // update your UI here
            }
        }

        // DispatchQueue with delay
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            // your task
        }
            
       
        // Dispatch Gruop
        
    let group = DispatchGroup()

        
        let say :(String) -> (Void) = { value in
            group.wait(timeout: DispatchTime.now() + .seconds(Int(arc4random_uniform(10))))
//            sleep(n)
            print(value)
            return "sample closure return value"
        }
        
        group.enter()
//        sleep(2)
        say("My dog is called Emma")
        group.leave()
        

        group.enter()
//        sleep(3)
        say("I develop iOS apps")
        group.leave()
        

        group.notify(queue: .main) {
//            sleep(0)
            say("Goodbye", 2)
        }
            
        
    

/**
 
 *** Creating a Dispatch Group
 
 init()
 // Creates a new group to which you can assign block objects.
 
 
 *** Adding a Completion Handler
 
 func notify(qos: DispatchQoS, flags: DispatchWorkItemFlags, queue: DispatchQueue, execute: () -> Void)
 // Schedules the submission of a block with the specified attributes to a queue when all tasks in the current group have finished executing.
 
 func notify(queue: DispatchQueue, work: DispatchWorkItem)
 // Schedules the submission of a block to a queue when all tasks in the current group have finished executing.
 
 
 *** Waiting for Tasks to Finish Executing
 
 func wait()
 // Waits synchronously for the previously submitted work to finish.
 
 func wait(timeout: DispatchTime) -> DispatchTimeoutResult
 // Waits synchronously for the previously submitted work to complete, and returns if the work is not completed before the specified timeout period has elapsed.
 
 func wait(wallTimeout: DispatchWallTime) -> DispatchTimeoutResult
 // Waits synchronously for the previously submitted work to complete, and returns if the work is not completed before the specified timeout period has elapsed.
 
 
 *** Updating the Group Manually
 
 func enter()
 // Explicitly indicates that a block has entered the group.
 
 func leave()
 // Explicitly indicates that a block in the group finished executing.

**/

/**
 
 *** NS Operation Queues
 
     - Unlike GCD, Operation Queues don’t conform to the First-In-First-Out order. Here are how operation queues are different from dispatch queues:

     - In operation queues, you can set priority for your operations and also you can add dependencies to the operations which means you can define that some operation execute only after the completion of other operations.
     
    - Operation queues operate concurrently and if you want to use them as serial queue you should handle it with adding dependencies.
 
 ** Methods:
        - Add operation : queue.addOperation()
 
 */


private func operationQueue {
    
    
    // Adding Operations
    queue  = OperationQueue()
    
    queue.addOperation( () -> Void in
        let img1 = Downloader.downloadImageWithURL(url: imageURLs[0])
        OperationQueue.main.addOperation({
            self.imageView1.image = img1
        })
    )
    
    // Block Operation - adding completion handlers
    
    let operation2 = BlockOperation(block: {
        let imag2 = Downloader.downloadImageWithURL(url: ImageURLs[2])
        OperationQueue.main.addOperation({
            self.imageView2.image = imag2
        })
    })
    
    operation2.completionBlock = {
        print("operation 2 is completed")
    }
    
    
    let operation3 = BlockOperation(block: {
        let imag3 = Downloader.downloadImageWithURL(url: ImageURLs[3])
        OperationQueue.main.addOperation({
            self.imageView3.image = imag3
        })
    })
    
    operation3.completionBlock = {
        print("operation 3 is completed")
    }
    
    queue.addOperation(operation2)
    
    // Caceling operations
    
    queue.cancelAllOperations()
    
    // Adding dependencies
    
    operation3.addDependency(operation2)
}


/*** Threads
 
  - Swift provides DispatchQueue as an excellent layer above raw threads. But sometimes you want to create a new thread dedicated to some specific task. Or maybe implement your own concurrent executor. Swift gives you access to raw threads
 
  - Use  this class when you want to have an Objective-C method run in its own thread of execution. Threads are especially useful when you need to perform a lengthy task, but don’t want it to block the execution of the rest of the application. In particular, you can use threads to avoid blocking the main thread of the application, which handles user interface and event-related actions. Threads can also be used to divide a large job into several smaller jobs, which can lead to performance increases on multi-core computers.
 
 
 */

class MyThread: Thread {
    
    override main() {
        print("Thread's starting point")
    }
}

let thread = MyThread()

//Thread is not started when the initializer is called. You need to call start() method explicitly to start the tread.
thread.start()


