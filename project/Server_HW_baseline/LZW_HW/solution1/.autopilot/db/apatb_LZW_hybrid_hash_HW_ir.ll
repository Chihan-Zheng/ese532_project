; ModuleID = '/mnt/castor/seas_home/c/chihan/chihan/ese532_project/project/Server/LZW_HW/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #0

; Function Attrs: noinline
define i16 @apatb_LZW_hybrid_hash_HW_ir(i8* %in, i16 %in_length, i16* %send_data) local_unnamed_addr #1 {
entry:
  %malloccall = tail call i8* @malloc(i64 4096)
  %in_copy = bitcast i8* %malloccall to [4096 x i8]*
  %malloccall1 = tail call i8* @malloc(i64 16388)
  %send_data_copy = bitcast i8* %malloccall1 to [8194 x i16]*
  %0 = bitcast i8* %in to [4096 x i8]*
  %1 = bitcast i16* %send_data to [8194 x i16]*
  call fastcc void @copy_in([4096 x i8]* %0, [4096 x i8]* %in_copy, [8194 x i16]* %1, [8194 x i16]* %send_data_copy)
  %2 = getelementptr inbounds [8194 x i16], [8194 x i16]* %send_data_copy, i32 0, i32 0
  %3 = call i16 @apatb_LZW_hybrid_hash_HW_hw(i8* %malloccall, i16 %in_length, i16* %2)
  call fastcc void @copy_out([4096 x i8]* %0, [4096 x i8]* %in_copy, [8194 x i16]* %1, [8194 x i16]* %send_data_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret i16 %3
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([4096 x i8]* readonly, [4096 x i8]* noalias, [8194 x i16]* readonly, [8194 x i16]* noalias) unnamed_addr #2 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4096i8([4096 x i8]* %1, [4096 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a8194i16([8194 x i16]* %3, [8194 x i16]* %2)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a4096i8([4096 x i8]* noalias, [4096 x i8]* noalias readonly) unnamed_addr #3 {
entry:
  %2 = icmp eq [4096 x i8]* %0, null
  %3 = icmp eq [4096 x i8]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4096 x i8], [4096 x i8]* %0, i64 0, i64 %for.loop.idx1
  %src.addr = getelementptr [4096 x i8], [4096 x i8]* %1, i64 0, i64 %for.loop.idx1
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr, i8* align 1 %src.addr, i64 1, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 4096
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a8194i16([8194 x i16]* noalias, [8194 x i16]* noalias readonly) unnamed_addr #3 {
entry:
  %2 = icmp eq [8194 x i16]* %0, null
  %3 = icmp eq [8194 x i16]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [8194 x i16], [8194 x i16]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i16* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [8194 x i16], [8194 x i16]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i16* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 2, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 8194
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([4096 x i8]*, [4096 x i8]* noalias readonly, [8194 x i16]*, [8194 x i16]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4096i8([4096 x i8]* %0, [4096 x i8]* %1)
  call fastcc void @onebyonecpy_hls.p0a8194i16([8194 x i16]* %2, [8194 x i16]* %3)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare i16 @apatb_LZW_hybrid_hash_HW_hw(i8*, i16, i16*)

define i16 @LZW_hybrid_hash_HW_hw_stub_wrapper(i8*, i16, i16*) #5 {
entry:
  %3 = bitcast i8* %0 to [4096 x i8]*
  %4 = bitcast i16* %2 to [8194 x i16]*
  call void @copy_out([4096 x i8]* null, [4096 x i8]* %3, [8194 x i16]* null, [8194 x i16]* %4)
  %5 = bitcast [4096 x i8]* %3 to i8*
  %6 = bitcast [8194 x i16]* %4 to i16*
  %7 = call i16 @LZW_hybrid_hash_HW_hw_stub(i8* %5, i16 %1, i16* %6)
  call void @copy_in([4096 x i8]* null, [4096 x i8]* %3, [8194 x i16]* null, [8194 x i16]* %4)
  ret i16 %7
}

declare i16 @LZW_hybrid_hash_HW_hw_stub(i8*, i16, i16*)

attributes #0 = { argmemonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
