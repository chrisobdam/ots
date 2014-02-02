require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "no title given" do    
    task = Task.build({})
    assert_equal task.valid?, false
  end
  
  test "no owner given" do    
    task = Task.build({title: "henk"})
    assert_equal task.valid?, false
  end

  test "empty owner given" do    
    task = Task.build({title: "henk", owner: ""})
    assert_equal task.valid?, false
  end

  test "owner given" do    
    task = Task.build({title: "henk", owner: "chris@task.af", identifier: "1234"})
    assert_equal task.valid?, true
    assert_equal task.owner.identifier, "chris@task.af"
  end

  test "no identifier given" do    
    task = Task.build({title: "henk", owner: "chris@task.af"})
    assert_equal task.valid?, false
  end

  test "with 1 assignee" do
    task = Task.build({title: "henk", assignees: [{identifier: "1234", status: "pending"}]})
    assert_equal task.assignees.size, 1
    assert_equal task.assignees.first.identifier, "1234"
    assert_equal task.assignees.first.status, "pending"    
  end

  test "with 2 listners" do
    task = Task.build({title: "henk", listeners: ["chris@task.af", "chip@task.af"]})
    assert_equal task.listeners.size, 2
    assert_equal task.listeners.first.user, "chris@task.af"
  end

  test "with empty assignee array" do
    task = Task.build({title: "henk", assignees: []})
    assert_equal task.assignees.size, 0
  end

  test "with malformed assignee array" do
    assert_raise Task::AssigneesError do
      task = Task.build({title: "henk", assignees: "a"})
    end
  end

  test "with malformed listeners array" do
    assert_raise Task::ListenersError do
      task = Task.build({title: "henk", listeners: "a"})
    end
  end

  test "with malformed comments array" do
    assert_raise Task::CommentsError do
      task = Task.build({title: "henk", comments: "a"})
    end
  end

  test "assignee without identifier" do
    task = Task.build({title: "henk", identifier: "1234", assignees: [{identifier: "as"}, {status: "empty"}]})
    assert_equal task.valid?, false
  end

  test "valid task" do
    task = Task.build({
                        title: "henk",
                        owner: "chris@task.af",
                        identifier: "123456",
                        due_date: "2014-01-23T20:51:32+01:00",
                        assignees: [{identifier: "1234"}, {identifier: "1234", status: "pending", token: "12345"}],
                        listeners: ["chris@task.af", "chris@task.af"],
                        comments: [{comment: "What's this", date: "2014-01-23T20:51:32+01:00"}]
                      })
    assert_equal task.valid?, true    
  end
  
  # todo
  #  - user asso werkend maken bij listener, en ook zo inrichten bij comment en assignee
  #  - assignee, listener, comment with and with out users in this server
  #  - check of er een user in de listener of assignee staat die op deze server geregistreerd staat
  #  - de keys die toe te wijzen zijn met task.new etc afschermen zodat je niet opeens de created_at oid kan zetten. Liefst dus white listen?
  #  - controller tests maken
  #  - afvangen wanneer de api end point geen task object bevat  
  #  - omzetten naar ots/task (deze zowel voor toewijzen taken als update van bestaande gaan gebruiken)
end