class Animal
  def initialize(sound)
    @sound = sound
  end

  def speak
    puts @sound
  end

  def self.speak
    puts 'I am a class'
  end
end

dog = Animal.new('woof')
dog.speak # 'woof'
Animal.speak # I am a class