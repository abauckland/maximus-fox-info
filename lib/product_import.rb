class ProductImport

#ProductImport.new(key, value, unit, standard)

   def initialize(key, value, unit, standard)
      @key = key
      @value = value
      @unit = unit
      @standard = standard
      
      @key_id = []
   end

ProductImport.new().setup
#product = productimport.new()
#product.verify
#product.import


  def verify
    
  end

  private
  def construct_data_set
    #assemble perform keys
    headers = @csv[0]
    
    line = @csv[i]
    
    #assemble rows
    
  end


  def create_product(perform_pairs)

#create product
  #check if it exists
  #if not create else get

#create identities
#create performs
#create instances
  #check if product with characs exists
  
  #check_instance = Instance.joins(:characs).where(:product_id => product.id, 'characs.perform_id' => perform_ids).first
  #if check_instance.blank?
  
  #end
  #if not create instance

  end

  def create_instance(product, code, perform_ids)
    #check if data set exists for product
    instance = Instance.create(:product_id => product.id, :code => code)
    create_instance_characs(instance.id, perform_ids)
  end


  def create_instance_characs(instance_id, perform_ids)
    peform_ids.each do |perform_id|
      Charac.create(:perform_id => perform_id, :instance_id => instance_id)
    end
  end


  def list_identity_pairs(identity_pairs)
    identity_ids = []
    identity_pairs.each do |pair|
      get_identity_pair(key, text)
      identity_ids << @identity_pair_id
    end
  end


  def list_perform_pairs(perform_pairs)
    perform_ids = []
    perform_pairs.each do |pair|
      get_perform_pair(key, text)
      peform_ids << @perform_pair_id
    end
# MyModel.create([{attr_1: some_attr, attr_2: 4}, {attr_1: some_attr, attr_2: 5}])
#class Membership < ActiveRecord::Base
#  def player_name
#    player && player.name
#  end

#  def player_name=(name)
#    self.player = Player.find_or_create_by_name(name) unless name.blank?
#  end
#end
  end


  def get_perform_pair(key, text)
    create_perform_keys(key)
    create_peform_values(value)

    @perform_pair_id = Perform.find_or_create(:performkey_id => @key_id, :performvalue_id => value_id).id
  end


  def get_perform_keys(key)
    clean_text(key)
    @key_id = Performkey.retrieve_or_create(@text).id
  end


  def get_perform_values(value)
    clean_text(value)
    @value_id = Performvalue.retrieve_or_create(@text).id
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


#Your tests can still reside in your /tests folder in the root of your app. You just need to do a 'require <lib>' at the top of the test. So if your file is "service.rb" in the lib directory, just "require service" in your test.

end