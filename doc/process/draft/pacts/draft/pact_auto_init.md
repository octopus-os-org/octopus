# 自动初始化机制

该机制用于系统早期的初始化，原始的显式枚举声明 由 caller 直接执行 callee 的方式耦合太大，不利于变化.
自动初始化机制提供了一种松耦合的方式，基本原理是 预先放置 callee 到某块区域(Section)，然后 caller 将执行这块区域的所有 callee.

## 具体约定

- section 名为 .octopus.init.default
- section 的起始地址(首字节)需要显示给出，名称为 octopus_init_default_begin
- section 的结束地址(尾字节)需要显示给出，名称为 octopus_init_default_end
- section 像是一个数组，其中的元素都要是同一类型(即所占空间大小相同)，名称为 OctopusInitDefaultElem

## 惯用语说明

- caller 初始化者
- callee 被初始化者