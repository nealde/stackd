import cython
cimport cython

@cython.boundscheck(False)
@cython.wraparound(False)
cdef norm(const double [:] a):
    cdef int k = 0
    cdef double val = 2.0
    cdef double n = 0.0
    for i in range(len(a)):
        k = i
        n = n+a[k]**val
    return n**0.5

@cython.boundscheck(False)
@cython.wraparound(False)
def cos(const int [:] inds1, const double [:] vals1, const int [:] inds2, const double [:] vals2):
    cdef double product = 0
    cdef int k = 0
    cdef int j = 0
    for count1 in range(len(inds1)):
        for count2 in range(len(inds2)):
            k = count1
            j = count2
            if inds1[k] == inds2[j]:
                product += vals1[k]*vals2[j]
    product /= (norm(vals1)*norm(vals2))
    return product
