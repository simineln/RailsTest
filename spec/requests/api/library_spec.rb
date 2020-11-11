# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/library', type: :request do
  path '/libraries' do
    post 'Adds new library' do
      tags 'Libraries'
      consumes 'application/json'
      parameter name: :library, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          address: { type: :string },
          description: { type: :string }
        },
        required: %w[name address description]
      }

      response '201', 'library added' do
        let(:library) { { name: 'foo', address: 'bar', description: 'foobar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:library) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/libraries/{id}' do
    delete 'Delete a library' do
      tags 'Libraries'
      consumes 'application/json', 'application/xml'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'Library deleted' do
        let(:id) { create(:library).id }

        run_test!
      end
    end
  end

  path '/libraries' do
    get 'Retrieves all libraries' do
      tags 'Libraries'
      produces 'application/json', 'application/xml'
      
      response '200', 'Library found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            address: { type: :string },
            description: { type: :string }
          },
          required: [ 'id', 'name', 'address', 'description' ]

        let(:id) { Library.create(name: 'foo', address: 'bar', description: 'foobar').id }
        run_test!
      end
    end
  end

  path '/libraries/{id}' do

    get 'Retrieves a library' do
      tags 'Libraries'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'Library found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            address: { type: :string },
            description: { type: :string }
          },
          required: [ 'id', 'name', 'address', 'description' ]

        let(:id) { Library.create(name: 'foo', password: 'bar', description: 'foobar').id }
        run_test!
      end

      response '404', 'Library not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end

end
