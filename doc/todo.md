- try move startup.zig into startup/ (which now will complain "import of file outside package path")
- optimize build script of rtthread finsh
- add uart abstraction

- 统一位寄存器bits操作 (modify)
- find a solution to "conditional compilation" used for different implementations (e.g. hardware-specific)