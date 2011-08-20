# -*- coding: utf-8 -*-
require 'sequel'
Sequel::Model.plugin(:schema)

Sequel.connect("sqlite://model/chars.db")

class Chars < Sequel::Model
	unless table_exists?
		set_schema do
			primary_key :id
			string :char
		end
		create_table
	end
end


