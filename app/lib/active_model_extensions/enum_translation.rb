# frozen_string_literal: true

module ActiveModel
  module Translation
    ##
    # Translates the value of the enum
    #
    # The translation must be in scope of model name:
    #   activerecord.attributes.#{model_name}.#{enum_name.pluralize}.#{enum_value}
    # or
    #   activemodel.attributes.#{model_name}.#{enum_name.pluralize}.#{enum_value}
    #
    # @param [String, Symbol] enum_name
    # @param [String, Symbol] enum_value
    #
    # @return [String]
    def human_enum_name(enum_name, enum_value)
      attributes_scope = "#{i18n_scope}.attributes"

      defaults = lookup_ancestors.map do |klass|
        :"#{attributes_scope}.#{klass.model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}"
      end

      I18n.t(defaults.shift)
    end
  end
end
