XPTemplate priority=personal

XPT class   " class ..
class `className^
{
public:

    `className^(`ctorParam^) {}
    ~`className^() {}

`cursor^

private:

};
..XPT

XPT once wrap	" #ifndef .. #define ..
XSET symbol=headerSymbol()
#ifndef `symbol^
#define `symbol^

namespace weta {
namespace `namespaceName^ {

`cursor^

}
}

#endif // `symbol^

..XPT

