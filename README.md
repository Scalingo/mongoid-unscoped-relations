# Unscoped Mongoid Relations gem

## Install

```ruby
gem 'mongoid-unscoped-relation'
```


## Usage

In the case of the default query scope excluse some documents

```ruby
class Document
  include Mongoid::Document
  include Mongoid::UnscopedBelongsTo

  unscoped_belongs_to :model

  field :deleted_at, type: DateTime
end
```

But in the relationship, it should find the given document by default

```ruby
class Model
  include Mongoid::Document

  default_scope ->{ where(deleted_at: nil) }

  has_many :documents
end
```

So then when the model is used, it will always find all the document

```ruby
> m = Model.create
> d = Document.create, model: m

> m.update deleted_at: Time.now
> Model.all.count
=> 0

> # Usually d.model => nil
> d.model
=> <Model _id: 123, deleted_at: [DateTime]>
```
