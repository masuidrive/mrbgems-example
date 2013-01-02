#include "mruby.h"
#include <stdio.h>

extern int result3();

static mrb_value
mrb_c_method_test(mrb_state *mrb, mrb_value self)
{
  return result3() == 123 ? mrb_true_value() : mrb_false_value();
}

void
mrb_mrbgems_example_gem_test(mrb_state *mrb)
{
  struct RClass *class_example = mrb_define_module(mrb, "ExampleExtensionTest");
  mrb_define_class_method(mrb, class_example, "c_method_test", mrb_c_method_test, ARGS_NONE());
}
