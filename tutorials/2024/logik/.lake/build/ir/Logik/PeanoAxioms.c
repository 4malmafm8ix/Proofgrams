// Lean compiler output
// Module: Logik.PeanoAxioms
// Imports: Init
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
LEAN_EXPORT lean_object* l_add(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_add___boxed(lean_object*, lean_object*);
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__11;
LEAN_EXPORT lean_object* l_instAdd_u2115;
LEAN_EXPORT lean_object* l_mul(lean_object*, lean_object*);
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__5;
lean_object* lean_nat_to_int(lean_object*);
static lean_object* l_instMul_u2115___closed__1;
static lean_object* l_instAdd_u2115___closed__1;
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__7;
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__2;
static lean_object* l_instRepr_u2115___closed__1;
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__3;
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__8;
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__4;
LEAN_EXPORT lean_object* l_instRepr_u2115;
LEAN_EXPORT lean_object* l_instMul_u2115;
LEAN_EXPORT lean_object* l_mul___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15_(lean_object*, lean_object*);
lean_object* l_Repr_addAppParen(lean_object*, lean_object*);
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__6;
LEAN_EXPORT lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____boxed(lean_object*, lean_object*);
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__9;
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__10;
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
static lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__1;
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("ℕ.zero", 8);
return x_1;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__2() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__1;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__3() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(2u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__4() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__3;
x_2 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__5() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__4;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__6() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__7() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__6;
x_2 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__2;
x_3 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__8() {
_start:
{
lean_object* x_1; uint8_t x_2; lean_object* x_3; 
x_1 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__7;
x_2 = 0;
x_3 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set_uint8(x_3, sizeof(void*)*1, x_2);
return x_3;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__9() {
_start:
{
lean_object* x_1; 
x_1 = lean_mk_string_from_bytes("ℕ.succ", 8);
return x_1;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__10() {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__9;
x_2 = lean_alloc_ctor(3, 1, 0);
lean_ctor_set(x_2, 0, x_1);
return x_2;
}
}
static lean_object* _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__11() {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__10;
x_2 = lean_box(1);
x_3 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_3, 0, x_1);
lean_ctor_set(x_3, 1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15_(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_3; uint8_t x_4; 
x_3 = lean_unsigned_to_nat(1024u);
x_4 = lean_nat_dec_le(x_3, x_2);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; 
x_5 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__5;
x_6 = l_Repr_addAppParen(x_5, x_2);
return x_6;
}
else
{
lean_object* x_7; lean_object* x_8; 
x_7 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__8;
x_8 = l_Repr_addAppParen(x_7, x_2);
return x_8;
}
}
else
{
lean_object* x_9; lean_object* x_10; uint8_t x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; 
x_9 = lean_ctor_get(x_1, 0);
x_10 = lean_unsigned_to_nat(1024u);
x_11 = lean_nat_dec_le(x_10, x_2);
x_12 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15_(x_9, x_10);
x_13 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__11;
x_14 = lean_alloc_ctor(5, 2, 0);
lean_ctor_set(x_14, 0, x_13);
lean_ctor_set(x_14, 1, x_12);
if (x_11 == 0)
{
lean_object* x_15; lean_object* x_16; uint8_t x_17; lean_object* x_18; lean_object* x_19; 
x_15 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__3;
x_16 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_16, 0, x_15);
lean_ctor_set(x_16, 1, x_14);
x_17 = 0;
x_18 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_18, 0, x_16);
lean_ctor_set_uint8(x_18, sizeof(void*)*1, x_17);
x_19 = l_Repr_addAppParen(x_18, x_2);
return x_19;
}
else
{
lean_object* x_20; lean_object* x_21; uint8_t x_22; lean_object* x_23; lean_object* x_24; 
x_20 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__6;
x_21 = lean_alloc_ctor(4, 2, 0);
lean_ctor_set(x_21, 0, x_20);
lean_ctor_set(x_21, 1, x_14);
x_22 = 0;
x_23 = lean_alloc_ctor(6, 1, 1);
lean_ctor_set(x_23, 0, x_21);
lean_ctor_set_uint8(x_23, sizeof(void*)*1, x_22);
x_24 = l_Repr_addAppParen(x_23, x_2);
return x_24;
}
}
}
}
LEAN_EXPORT lean_object* l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15_(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
static lean_object* _init_l_instRepr_u2115___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_instRepr_u2115() {
_start:
{
lean_object* x_1; 
x_1 = l_instRepr_u2115___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l_add(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_inc(x_1);
return x_1;
}
else
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_2);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; 
x_4 = lean_ctor_get(x_2, 0);
x_5 = l_add(x_1, x_4);
lean_ctor_set(x_2, 0, x_5);
return x_2;
}
else
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_6 = lean_ctor_get(x_2, 0);
lean_inc(x_6);
lean_dec(x_2);
x_7 = l_add(x_1, x_6);
x_8 = lean_alloc_ctor(1, 1, 0);
lean_ctor_set(x_8, 0, x_7);
return x_8;
}
}
}
}
LEAN_EXPORT lean_object* l_add___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_add(x_1, x_2);
lean_dec(x_1);
return x_3;
}
}
static lean_object* _init_l_instAdd_u2115___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_add___boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_instAdd_u2115() {
_start:
{
lean_object* x_1; 
x_1 = l_instAdd_u2115___closed__1;
return x_1;
}
}
LEAN_EXPORT lean_object* l_mul(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_2) == 0)
{
lean_object* x_3; 
lean_dec(x_1);
x_3 = lean_box(0);
return x_3;
}
else
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; 
x_4 = lean_ctor_get(x_2, 0);
lean_inc(x_1);
x_5 = l_mul(x_1, x_4);
x_6 = l_add(x_5, x_1);
lean_dec(x_5);
return x_6;
}
}
}
LEAN_EXPORT lean_object* l_mul___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_mul(x_1, x_2);
lean_dec(x_2);
return x_3;
}
}
static lean_object* _init_l_instMul_u2115___closed__1() {
_start:
{
lean_object* x_1; 
x_1 = lean_alloc_closure((void*)(l_mul___boxed), 2, 0);
return x_1;
}
}
static lean_object* _init_l_instMul_u2115() {
_start:
{
lean_object* x_1; 
x_1 = l_instMul_u2115___closed__1;
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Logik_PeanoAxioms(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__1 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__1();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__1);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__2 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__2();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__2);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__3 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__3();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__3);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__4 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__4();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__4);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__5 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__5();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__5);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__6 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__6();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__6);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__7 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__7();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__7);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__8 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__8();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__8);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__9 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__9();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__9);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__10 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__10();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__10);
l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__11 = _init_l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__11();
lean_mark_persistent(l___private_Logik_PeanoAxioms_0__repr_u2115____x40_Logik_PeanoAxioms___hyg_15____closed__11);
l_instRepr_u2115___closed__1 = _init_l_instRepr_u2115___closed__1();
lean_mark_persistent(l_instRepr_u2115___closed__1);
l_instRepr_u2115 = _init_l_instRepr_u2115();
lean_mark_persistent(l_instRepr_u2115);
l_instAdd_u2115___closed__1 = _init_l_instAdd_u2115___closed__1();
lean_mark_persistent(l_instAdd_u2115___closed__1);
l_instAdd_u2115 = _init_l_instAdd_u2115();
lean_mark_persistent(l_instAdd_u2115);
l_instMul_u2115___closed__1 = _init_l_instMul_u2115___closed__1();
lean_mark_persistent(l_instMul_u2115___closed__1);
l_instMul_u2115 = _init_l_instMul_u2115();
lean_mark_persistent(l_instMul_u2115);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
