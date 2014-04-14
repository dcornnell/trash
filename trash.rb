require 'rspec'


class Trash
	attr_reader :capacity, :contents, :full
	def initialize
		@capacity = 50
		@contents = 0
		@full = false
	end

	def put_trash
		@contents += 50
	end

	def full?
		if @contents != @capacity
			@full = false
			
		else 
		 	@full = true
		
		end
	end
end

class House
	attr_reader :trash_location, :trash
 def initialize
 	@trash_location = "kitchen"
 	trash = Trash.new
 end

 def takeout_trash
 	if @full == true
 		@trash_location = "curb"
 		puts "the trash is on the curb"
 	else
 		@trash_location = "kitchen" 
 		puts "the trash is in the kitchen"
 	end
 end

end

describe Trash do
	let(:trash) {Trash.new}
	it 'should have a max capcity' do 
		trash.capacity.should eq(50)
	end 

	it 'should be be able to be filled' do 
		trash.put_trash
		trash.contents.should_not eq(0)
	end

	it 'should be considered full if its contents are equal to its capacity' do
		trash.put_trash
		trash.full?.should eq(true)
	end
end

describe House do
	let(:house) {House.new}
	let(:trash) {Trash.new}
	it 'should have a starting trash location' do
		house.trash_location.should eq("kitchen")
	end

	it 'should move to the curb if it is full' do 
		trash.put_trash
		trash.full?
		house.takeout_trash
		house.trash_location.should_not eq("kitchen")
	end
end


