#ifndef HELLO_H
#define HELLO_H

#include <string>
#include <utility>

class Hello {
   private:
    std::string target;

   public:
    explicit Hello(std::string target) : target(std::move(target)) {}
    void hello() const;
    void crash() const;
    [[nodiscard]] auto getTarget() const { return target; }
};

#endif  // HELLO_H