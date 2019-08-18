class Owner

  attr_reader :name, :species
  
  attr_accessor :cat, :dog
  
  @@all = [ ]
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = [ ]
    @dogs = [ ]
  end
  
  def say_species
    @species="I am a #{@species}."
  end

  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select { |cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select { |dog| dog.owner == self}
  end
  
  def buy_cat(name)
   Cat.new(name, self)
  end 
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def feed_cats
    Cat.all.select {|cat| cat.mood = 'happy'}
  end
  
  def walk_dogs
    Dog.all.select {|dog| dog.mood = 'happy'}
  end
  
  def sell_pets
    pets = @cats.flatten(dogs)
    pets.each { |pet| pet.mood = 'nervous'}
  end
  
  def list_pets
    "I have #{self.dog.length} dogs, and #{Cat.length} cats." 
  end
  
end