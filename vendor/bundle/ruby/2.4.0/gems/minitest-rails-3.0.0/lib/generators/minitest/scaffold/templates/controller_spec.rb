require "test_helper"

<% module_namespacing do -%>
describe <%= controller_class_name %>Controller do
  <%- if mountable_engine? -%>
  include Engine.routes.url_helpers

  <%- end -%>
  let(:<%= singular_table_name %>) { <%= fixture_name %> :one }

  it "gets index" do
    get <%= index_helper %>_url
    value(response).must_be :success?
  end

  it "gets new" do
    get <%= new_helper %>
    value(response).must_be :success?
  end

  it "creates <%= singular_table_name %>" do
    expect {
      post <%= index_helper %>_url, params: { <%= "#{singular_table_name}: { #{attributes_hash} }" %> }
    }.must_change "<%= class_name %>.count"

    must_redirect_to <%= singular_table_name %>_path(<%= class_name %>.last)
  end

  it "shows <%= singular_table_name %>" do
    get <%= show_helper %>
    value(response).must_be :success?
  end

  it "gets edit" do
    get <%= edit_helper %>
    value(response).must_be :success?
  end

  it "updates <%= singular_table_name %>" do
    patch <%= show_helper %>, params: { <%= "#{singular_table_name}: { #{attributes_hash} }" %> }
    must_redirect_to <%= singular_table_name %>_path(<%= "#{singular_table_name}" %>)
  end

  it "destroys <%= singular_table_name %>" do
    expect {
      delete <%= show_helper %>
    }.must_change "<%= class_name %>.count", -1

    must_redirect_to <%= index_helper %>_path
  end
end
<% end -%>
