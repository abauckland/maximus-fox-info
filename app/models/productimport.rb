class Productimport

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :action, :csv
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def check(file)
  #performance row structure
    #row 1 => perform keys
    #row 2 => units
    #row 3 => standard references
    #row 4+ => product data

    csv = CSV.read(file.path)
    headers = csv[0]
    units = csv[1]
    standards = csv[2]

    return false if check_length(csv)
    return false if check_standard_headers(headers)
    return false if check_empty_headers(headers)
    return false if check_units(units)
    return false if check_standards(standards)

  end

  def import(file)
  #csv import file structure
  #column structure
    # => product info
    #----------------------------
    # => instance ref
    #----------------------------
    # => performance info

  #performance row structure
    #row 1 => perform keys
    #row 2 => units
    #row 3 => standard references
    #row 4+ => product data

    csv = CSV.read(file.path)
    headers = csv[0]
    units = csv[1]
    standards = csv[2]

    perform_keys(headers, units, standards)

    #for each line of data    
    last_row_of_data = (csv.length - 1)
    (3..last_row_of_data).each do |i|

      line = csv[i]
      previous_line = CSV[(i-1)]

      length = PRODUCT_IMPORT_HEADERS.length
      unless line[0..length] == previous_line[0..length]
        create_product(line)
      end

      #find or create performance pairs for line
      instance_perform_pair_ids = []
      ((length+1)..(headers.length - 1)).each_with_index do |m|

        performkey_id = @perform_keys[m-(length+1)]

        value = clean_text(line[m])
        peformvalue = Peformvalue.where(:text => value).first_or_create

        perform_pair = perform.where(:performkey_id => peformkey_id, :performvalue_id => peformvalue.id).first_or_create
        instance_perform_pair_ids << perform_pair.id 
      end

      #check if existing set occurs for product
      instance = Instance.joins(:characs).where('characs.performvalue_id' => instance_perform_pair_ids, product_id => @product.id).first
      if instance.blank?
        #create new instance
        instance_ref = line[(PRODUCT_IMPORT_HEADERS.length+1)]
        clean_text(instance_ref)
        instance = Instance.create(:product_id => @product.id, :ref => @text)
        #create characs
        instance_perform_pair_ids.each do |perform_id|
          @characteristic = Characs.create(:instance_id => instance.id, :perform_id => perform_id)
        end
      end

    end
  end

  private
  def perform_keys(headers, units, standards)
    @performkey_ids =[]

    ((PRODUCT_IMPORT_HEADERS.length+1)..(headers.length)).each_with_index do |n|
      unit = Unit.where(:text => units[n]).first_or_create
      standard = Standard.where(:text => standards[n]).first_or_create
      clean_text(headers[n]) #returns @text

      peformkey = Performkey.where(:text => @text, unit_id => unit.id, standard_id => standard.id).first_or_create
      @performkey_ids << performkey.id
    end
  end


  def check_length(csv)
    if csv.length <= 3
      errors.add :length, "CSV is empty"
      true
    end
  end

  def check_standard_headers(headers)
    PRODUCT_IMPORT_HEADERS.each_with_index do  |text, i|
      unless headers[i] == text 
        errors.add :headers, 'please make sure column '+i.to_s+' is titled "'+text.to_s+'"'
        true
      end
    end
  end

  def check_empty_headers(headers)
    #check no header values are nil
    header_count = headers.length - headers.compact.length
    if header_count >= 1
      errors.add :header_count, header_count+' column heading(s) are blank, all columns must have a title'
      true
    end 
  end

  def check_units(units)
    #check unit headers are units
    units.each_with_index do |unit, i|
      unless unit == ""
        check_unit = Unit.where(:ref => unit).first
        unless check_unit
          errors.add :units, check_unit.text.to_s+" not recognised as a unit in column "+i.to_s
          true
        end
      end  
    end
  end

  def check_standards(standards)
    #check standard refs are standards
    standards.each_with_index do |standard, i|
      unless standard == ""
        check_standard = Standard.where(:ref => standard).first
        unless check_standard
          errors.add :units, standard.to_s+" not recognised standard in column "+i.to_s
          true
        end
      end     
    end
  end

  def get_item_id(item_title)
    clean_text(item_title)
    @item = Item.where(:title => @text).first
  end

  def create_product(line)

    #item_title = line[1]
    #company    = line[2]
    #ref        = line[3]
    #name       = line[4]
    #range_name = line[5]
    #type       = line[6]
    #keywords   = line[7].split(",")
    #parent_ref = line[8]

    get_item_id(line[1])
    get_company_id(line[2])
    get_range_id(5)
    get_keyword_array(line[7])
    get_parent_id(@company, line[8])

    params = { :product => 
                { :item_id => @item.id,
                  :company => @company.id,
                  :reference => line[3],
                  :name => line[4],
                  :range => @range.id,
                  :type => @type.id,
                  :parent_ref => @parent.id,
                  :keyword_attributes => { :name => keyword_ids }
                 }
              }

    @product = Product.create(params[:product]).first_or_create

  end

  def get_company_id(company)
    clean_text(company)
    @company = Company.where(:name => @text).first
  end

  def get_range_id(range)
    clean_text(company)
    @range = Range.where(:name => @text).first_or_create
  end

  def get_keyword_array(keyword_string)
    keyword_array = keyword_string.split(",")#

    keywords.each_with_index do |keyword|
      clean_text(keyword)
      Keyword.where(:text => @text).first_or_create
    end
#TODO if clean text changed anything this will fail
    @keyword_ids = Keyword.where(:text => keywords).ids
  end

  def get_parent_id(company, ref)
    @parent = Product.where(:ref => parent_ref, :company => company.id).first
  end

  def perform_keys(headers, units, standards)
        perform_pair_array = []
        ((PRODUCT_IMPORT_HEADERS.length)..(headers.length - 1)).each_with_index do |header, m|
        end
  end

  def clean_text(text)
    @text = text
    @text.strip
    @text = @text.gsub(/\n/,"")
    @text.chomp
    @text.chomp
    while [",", ";", "!", "?"].include?(@text.last)
      @text.chop!
    end
  end

end