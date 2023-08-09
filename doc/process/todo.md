## Arch

- The system should comprise multiple parts (modules), they work together to compose a system, what they will be and how to implement? 
    - IDM module
        - identity manager
- A mechanism to CURD module for the system
- A auto-initialization mechanism

## Detail

- try move startup.zig into startup/ (which now will complain "import of file outside package path")
- optimize build script of rtthread finsh
- add uart abstraction

- 统一位寄存器bits操作 (modify)
- find a solution to "conditional compilation" used for different implementations (e.g. hardware-specific)