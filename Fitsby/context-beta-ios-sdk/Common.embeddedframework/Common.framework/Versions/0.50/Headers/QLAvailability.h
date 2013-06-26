
#define DEPRECATED __attribute__((deprecated))

#define SuppressDeprecatedWarning(invocation) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
        invocation; \
        _Pragma("clang diagnostic pop") \
    } while (0)
