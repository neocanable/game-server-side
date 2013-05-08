require File.expand_path(File.dirname(__FILE__) + "/static_helper")

ActiveRecord::Base.send :include, StaticHelper
ActiveRecord::Base.send :extend, StaticHelper


ActiveRecord::Base.class_eval do 

    def self.validates_code_defined_of(*attr_names)
      options = attr_names.extract_options!
      raise "missing code table" unless options[:code_table]
      options[:message] ||= :ERROR

      validates_each(attr_names, options) do |record, attr_name, value|
        unless Vici::Code.code_defined?(value, options[:code_table])
          record.errors.add(attr_name, options[:message])
        end
      end
    end
    
    def self.paginate(page, per_page, options = "")
      count = count(:conditions => options)
      pages = count/per_page
      pages += 1 if count%per_page > 0
      page += 1
      page = pages if page > pages
      page = 1 if page <= 0
      offset = page == 0 ? 1 : (page-1)*per_page
      results = find(:all, :conditions => options, :offset => offset, :limit => per_page)
      [results, pages]
    end
end
