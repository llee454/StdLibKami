Require Import Kami.AllNotations.
Require Import StdLibKami.Fifo.Ifc.
Require Import StdLibKami.Prefetcher.FifoTop.Async.
Require Import StdLibKami.Prefetcher.FifoTop.Ifc.
Section prefetcher.
  Context `{FifoTopParams}.
  Context (reqResK: Kind).
  Record Prefetcher: Type :=
    {
      flush: forall {ty}, ActionT ty Void;
      getIsCompleting: forall {ty}, ActionT ty (Maybe PAddr);
      addAddr: forall {ty}, ty PAddr -> ActionT ty Bool;
      memCallback: forall {ty}, ty AddrInst -> ActionT ty Void;
      fetchInstruction: forall {ty}, ActionT ty DeqRes;
      (* Rule *)
      doPrefetch: forall {ty}, ActionT ty Void
    }.
End prefetcher.
