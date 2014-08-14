# http://stackoverflow.com/questions/14972253/simpleform-default-input-class
# https://github.com/plataformatec/simple_form/issues/316

inputs = %w[
  CollectionSelectInput
  DateTimeInput
  FileInput
  GroupedCollectionSelectInput
  NumericInput
  PasswordInput
  RangeInput
  StringInput
  TextInput
]

#inputs.each do |input_type|
#  superclass = "SimpleForm::Inputs::#{input_type}".constantize
#
#  new_class = Class.new(superclass) do
#    def input_html_classes
#      super.push('form-control')
#    end
#  end
#
#  Object.const_set(input_type, new_class)
#end

# formtastic name collision avoidance
# https://github.com/gregbell/active_admin/issues/2703
inputs.each do |input_type|
  "SimpleForm::Inputs::#{input_type}".constantize.class_eval do
    alias_method :__input_html_classes, :input_html_classes
    define_method(:input_html_classes) do
      __input_html_classes.push('form-control')
    end
  end
end
