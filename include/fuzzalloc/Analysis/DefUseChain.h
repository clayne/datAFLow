//===-- DefUseChain.h - Static def-use analysis -----------------*- C++ -*-===//
///
/// \file
/// Perform a static def-use chain analysis
///
//===----------------------------------------------------------------------===//

#ifndef DEF_USE_CHAINS_H
#define DEF_USE_CHAINS_H

#include <llvm/Pass.h>
#include <llvm/Support/JSON.h>

#include "absl/container/flat_hash_map.h"
#include "absl/container/flat_hash_set.h"

#include "Graphs/VFGNode.h"
#include "MemoryModel/PointerAnalysis.h"

namespace llvm {
class DebugLoc;
class DIVariable;
class Instruction;
class Value;
} // namespace llvm

/// A variable definition
struct DefSite {
  DefSite(const SVF::VFGNode *Node, const llvm::DIVariable *DIVar,
          const llvm::DebugLoc *Loc)
      : Node(Node), Val(Node->getValue()), DIVar(DIVar), Loc(Loc) {}

  bool operator==(const DefSite &Other) const { return Node == Other.Node; }

  template <typename H> friend H AbslHashValue(H Hash, const DefSite &Def) {
    return H::combine(std::move(Hash), Def.Node);
  }

  const SVF::VFGNode *Node;
  const llvm::Value *Val;
  const llvm::DIVariable *DIVar;
  const llvm::DebugLoc *Loc;
};

/// A variable use
struct UseSite {
  UseSite(const SVF::VFGNode *Node)
      : Node(Node), Val(Node->getValue()),
        Loc(cast<llvm::Instruction>(Val)->getDebugLoc()) {}

  bool operator==(const UseSite &Other) const { return Node == Other.Node; }

  template <typename H> friend H AbslHashValue(H Hash, const UseSite &Use) {
    return H::combine(std::move(Hash), Use.Node);
  }

  const SVF::VFGNode *Node;
  const llvm::Value *Val;
  const llvm::DebugLoc &Loc;
};

/// Static def-use chain analysis
class DefUseChain : public llvm::ModulePass {
public:
  using DefSet = absl::flat_hash_set<DefSite>;
  using UseSet = absl::flat_hash_set<UseSite>;
  using DefUseMap = absl::flat_hash_map<DefSite, UseSet>;

  static char ID;
  DefUseChain(SVF::PointerAnalysis::PTATY WPATy =
                  SVF::PointerAnalysis::AndersenWaveDiff_WPA)
      : llvm::ModulePass(ID), AnalysisTy(WPATy) {}
  virtual ~DefUseChain();

  virtual void getAnalysisUsage(llvm::AnalysisUsage &) const override;
  virtual bool runOnModule(llvm::Module &) override;

  const DefUseMap &getDefUseChains() const { return DefUses; }
  const SVF::PointerAnalysis::PTATY getAnalysisTy() const { return AnalysisTy; }

private:
  SVF::PointerAnalysis::PTATY AnalysisTy;
  DefUseMap DefUses;
};

// JSON helpers
llvm::json::Value toJSON(const DefSite &);
llvm::json::Value toJSON(const UseSite &);
llvm::json::Value toJSON(const DefUseChain::UseSet &);

#endif // DEF_USE_CHAINS_H
