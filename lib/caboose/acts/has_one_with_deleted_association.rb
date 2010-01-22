module Caboose # :nodoc:
  module Acts # :nodoc:
    class HasOneWithDeletedAssociation < ActiveRecord::Associations::HasOneAssociation
      private
      def find_target
        @reflection.klass.find_with_deleted(:first, 
          :conditions => @finder_sql, 
          :order      => @reflection.options[:order], 
          :include    => @reflection.options[:include]
        )
      end
    end
  end
end
