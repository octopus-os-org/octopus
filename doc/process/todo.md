- The system should comprise multiple parts (modules), they work together to compose a system, what they will be and how to implement? 
    - IDM module
        - identity manager
- A mechanism to CURD module for the system

## List

- [x] add irq abstraction (cpu level)
- [x] add pin abstraction (cpu level)
- [x] add gpio abstraction (cpu level)
- [x] using heap on rtthread
- [x] add adc abstraction (cpu level) (weak)
- [x] (partially) make octopus to be a separate module
- [x] update to zig 0.11.0
- [x] try move startup.zig into startup/ (which now will complain "import of file outside package path")
- [x] add initialization mechanism

- [ ] optimize build script of rtthread finsh
- [ ] add uart abstraction

- [ ] 统一位寄存器bits操作 (modify)
- [x] find a solution to "conditional compilation" used for different implementations (e.g. hardware-specific)