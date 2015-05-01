require('rspec')
require('word')

describe(Word) do

  before() do
    Word.clear()
  end

  describe('#name') do
    it("returns the name of the word") do
      test_word = Word.new("Awesome")
      expect(test_word.name()).to(eq("Awesome"))
    end
  end

  describe('#id') do
    it("returns the id of the word") do
      test_word = Word.new("Awesome")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#defs') do
    it("initially returns an empty array of definitions for the word") do
      test_word = Word.new("Awesome")
      expect(test_word.defs()).to(eq([]))
    end
  end

  describe('.clear') do
    it("empties out all of the saved words") do
      Word.new("Awesome").save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a word to the array of saved words") do
      test_word = Word.new("Awesome")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".find") do
    it("returns a word by it's id number") do
      test_word = Word.new("Awesome")
      test_word.save()
      test_word2 = Word.new("Best")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end
