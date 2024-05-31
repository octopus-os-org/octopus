.global csr_read_mhartid
csr_read_mhartid:
    csrr   a0, mhartid
    ret
