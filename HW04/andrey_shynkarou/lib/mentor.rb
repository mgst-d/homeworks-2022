# frozen_string_literal: true

require_relative './person'
require_relative './notification'

class Mentor < Person
  def notifications
    read_file('notification.txt')
  end

  def add_homework(title:, description:, student:)
    @notification = Notification.new if @notification.nil?
    write_to_file('homework.txt',
                  "#{@notification.add_homework} #{title}, #{description} for #{student.name} #{student.surname}.\n")
    Homework.new(title: title, description: description, student: student)
  end

  def mark_as_read!
    @notification = Notification.new if @notification.nil?
    write_to_file('notification.txt',
                  "Mentor #{name} #{surname} #{@notification.mark_as_read!}.\n")
  end

  def accept!(homework)
    @notification = Notification.new if @notification.nil?
    write_to_file('notification.txt',
                  "Homework #{homework.title} #{homework.description} #{@notification.accept!}.\n")
  end

  def reject_to_work!(homework)
    @notification = Notification.new if @notification.nil?
    write_to_file('notification.txt',
                  "Answer for #{homework.title} #{homework.description} #{@notification.reject_to_work!}.\n")
  end

  def subscribe_to!(student)
    @notification = Notification.new if @notification.nil?
    write_to_file('notification.txt',
                  "Mentor #{name} #{surname} #{@notification.subscribe_to!} #{student.name} #{student.surname}.\n")
  end
end
