//===-- VariableTag.h - Common tagging functionality ------------*- C++ -*-===//
///
/// \file
/// Common tagging functionality
///
//===----------------------------------------------------------------------===//

#ifndef VARIABLE_TAG_H
#define VARIABLE_TAG_H

#include <llvm/IR/IRBuilder.h>

namespace llvm {
class ConstantInt;
class DIVariable;
class IntegerType;
class Instruction;
class Module;
class Type;
class TypeSize;
class Value;
} // namespace llvm

/// Randomly generate a def site tag
llvm::ConstantInt *generateTag(llvm::IntegerType *);

/// Compute the adjusted size for a tagged variable
size_t getTaggedVarSize(const llvm::TypeSize &);

/// Insert a call to `malloc`
llvm::Instruction *insertMalloc(llvm::Type *, llvm::Value *,
                                llvm::Instruction *, bool = true);

/// Insert a call to `free`
llvm::Instruction *insertFree(llvm::Type *, llvm::Value *, llvm::Instruction *);

/// Insert a call the debug variable def runtime function
void loglDbgDef(llvm::ConstantInt *, const llvm::DIVariable *, llvm::Module *,
                llvm::IRBuilder<> &);

#endif // VARIABLE_TAG_H
