#include <mruby.h>

extern int result3(); /* Generated from mrbgem.rake */

static mrb_value
mrb_c_method(mrb_state *mrb, mrb_value self)
{
  return mrb_fixnum_value(result3());
}

void
mrb_mrbgems_example_gem_init(mrb_state* mrb) {
  struct RClass *class_example = mrb_define_module(mrb, "ExampleExtension");
  mrb_define_class_method(mrb, class_example, "c_method", mrb_c_method, ARGS_NONE());
}
