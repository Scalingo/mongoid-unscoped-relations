module Mongoid
  module UnscopedBelongsTo
    extend ActiveSupport::Concern

    module ClassMethods
      def unscoped_belongs_to(field, args = {})
        belongs_to field, args

        define_method field do
          field_id = send("#{field}_id")
          field_name = "@#{field}"
          return nil if field_id.nil?

          cur_value = instance_variable_get field_name
          return cur_value if cur_value.present?

          clazz = Object.const_get self.relations[field.to_s].class_name
          cur_value = clazz.unscoped.find field_id
          return instance_variable_set field_name, cur_value
        end

        mongoid_setter = instance_method("#{field}=")
        define_method "#{field}=" do |field_value|
          instance_variable_set "@#{field}", field_value
          mongoid_setter.bind(self).call(field_value)
        end
      end
    end
  end
end
