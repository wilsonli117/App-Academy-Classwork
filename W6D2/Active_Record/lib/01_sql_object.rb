require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    query = DBConnection.execute2(<<-SQL)
      SELECT 
        *
      FROM
        "#{self.table_name}"

    SQL

    @columns = query[0]
    @columns.map!(&:to_sym)
  end

  def self.finalize!

    columns.each do |col|
      define_method(col) do
        self.attributes[col]
      end

      define_method("#{col}=") do |arg|
        self.attributes[col] = arg
      end

    end

  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= "#{self}".tableize
  end

  def self.all
    # ...
    query = DBConnection.execute(<<-SQL)
    SELECT
      *
    FROM
      "#{self.table_name}"
    SQL
    
    self.parse_all(query)
  end

  def self.parse_all(results)
    # ...
    arr = []

    results.each do |result|
      arr << self.new(result)
    end

    arr
  end

  def self.find(id)
    # ...
    query = DBConnection.execute2(<<-SQL)
      SELECT 
        *
      FROM
        "#{self.table_name}"
      WHERE
        id = id
      LIMIT 1

    SQL

    self.new(query[0])
  end

  def initialize(params = {})

    params.each do |key,val|
      sym_key = key.to_sym
      raise "unknown attribute '#{sym_key}'" unless self.class.columns.include?(sym_key)
      self.send("#{sym_key}=", val)
    end

  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
