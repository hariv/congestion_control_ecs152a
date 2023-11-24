#  ECS 152A Programming Assignment 3 (Fall 2023)
## Congestion Control
Derived from https://github.com/Haroon96/ecs152a-fall-2023/tree/main/week7
### Docker Installation
* [Linux](https://docs.docker.com/engine/install/ubuntu/)
* [Mac](https://docs.docker.com/desktop/install/mac-install/)
* [Windows](https://docs.docker.com/desktop/install/windows-install/)

### How to use
(From the `docker` directory).
1. Run `./start-simulator.sh` to start running our receiver with the emulated network profile. Once it's running successfully, you will see a message saying `Receiver running`. 
2. The receiver has already been programmed to send acknowledgements to the sender similar to the receiver in the discussion.
3. Implement your own sender code and bind it to any port other than 5001. Send packets to localhost, port 5001 to communicate with the receiver.
4. Your sender has to send -1 as the `sequence number`  to indicate that it has finished sending data.
5. Invoke your sender.
6. Once the receiver has received the -1 after receiving all the data, it will terminate.
