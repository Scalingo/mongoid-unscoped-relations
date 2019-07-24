RSpec.describe Mongoid::UnscopedBelongsTo do
  class Model
    include Mongoid::Document

    default_scope ->{ where(deleted_at: nil) }

    field :deleted_at, type: DateTime

    has_many :documents
  end

  class Document
    include Mongoid::Document
    include Mongoid::UnscopedBelongsTo

    unscoped_belongs_to :model
  end

  describe '#unscoped_belongs_to' do
    it 'should return nil if there is no field_id' do
      d = Document.new
      d.model_id = nil
      expect(d.model).to eq nil
    end

    it 'should return the user if the user is present' do
      m = Model.create
      d = Document.new
      d.model = model
      expect(d.model).to eq m
    end

    it 'should use its cache if there is one' do
      d = Document.new
      d.model = Model.create
      d.instance_variable_set '@model', 'TestValue'
      expect(d.model).to eq 'TestValue'
    end

    it 'should unscope values' do
      m = Model.create
      d = Document.new
      d.model = m
      d.update_attribute :deleted_at, DateTime.now
      expect(d.model).to eq m
    end

    it 'shoud invalidate cache when the user has changed' do
      m = Model.create
      d = Document.new
      d.model = m
      expect(d.model).to eq m
      m2 = Model.create
      d.model = m2
      expect(d.model).to eq m2
    end
  end
end
