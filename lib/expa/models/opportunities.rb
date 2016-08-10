require_relative 'programmes'
require_relative 'people'
require_relative 'offices'

class Opportunity

  # Data that comes at the lists from people
  attr_accessor :id
  attr_accessor :title
  attr_accessor :url
  attr_accessor :status
  attr_accessor :current_status
  attr_accessor :location
  attr_accessor :programmes
  attr_accessor :application_count
  attr_accessor :views
  attr_accessor :duration_min
  attr_accessor :duration_max
  attr_accessor :applications_close_date
  attr_accessor :earliest_start_date
  attr_accessor :latest_end_date
  attr_accessor :profile_photo_url
  attr_accessor :cover_photo_urls
  attr_accessor :created_at, :updated_at

  # Data that comes at the get attributes

  attr_accessor :office
  attr_accessor :is_gep, :is_ge
  attr_accessor :favorites
  attr_accessor :applied_to
  attr_accessor :host_lc
  attr_accessor :home_lc
  attr_accessor :project
  attr_accessor :openings
  attr_accessor :available_openings
  attr_accessor :skills, :backgrounds, :languages, :issues, :work_fields, :study_levels, :prefered_locations
  attr_accessor :role_info, :logistic_info, :legal_info, :specifics_info
  attr_accessor :department
  attr_accessor :tm_details
  attr_accessor :nps_score

  def initialize(json)
    self.id = json['id'] unless json['id'].nil?
    self.title = json['title'] unless json['title'].nil?
    self.url = URI(json['url']) unless json['url'].nil?
    self.status = json['status'] unless json['status'].nil?
    self.current_status = json['current_status'] unless json['status'].nil?
    self.location = json['location'] unless json['location'].nil?
    self.programmes = json['programmes'] unless json['programmes'].nil?
    self.managers = json['managers'] unless json['managers'].nil?
    self.application_count = json['applications_count'] unless json['applications_count'].nil?
    self.views = json['views'] unless json['views'].nil?
    self.duration_min = json['duration_min'] unless json['duration_min'].nil?
    self.duration_max = json['duration_max'] unless json['duration_max'].nil?
    self.applications_close_date = Time.parse(json['applications_close_date']) unless json['applications_close_date'].nil?
    self.earliest_start_date = Time.parse(json['earliest_start_date']) unless json['earliest_start_date'].nil?
    self.latest_end_date = Time.parse(json['latest_end_date']) unless json['latest_end_date'].nil?
    self.profile_photo_url = URI(json['profile_photo_url']) unless json['profile_photo_url'].nil?
    self.cover_photo_urls = json['cover_photo_urls'] unless json['cover_photo_urls'].nil?
    self.created_at = json['created_at'] unless json['created_at'].nil?
    self.updated_at = json['updated_at'] unless json['updated_at'].nil?
    self.office = Office.new(json['office']) unless json['office'].nil?
    self.is_gep = json['is_gep'] unless json['is_gep'].nil?
    self.is_ge = json['is_ge'] unless json['is_ge'].nil?
    self.favorites = json['favorites'] unless json['favorites'].nil?
    self.applied_to = json['applied_to'] unless json['applied_to'].nil?
    self.host_lc = json['host_lc'] unless json['host_lc'].nil?
    self.home_lc = json['home_lc'] unless json['home_lc'].nil?
    self.project = json['project'] unless json['project'].nil?
    self.openings = json['openings'] unless json['openings'].nil?
    self.available_openings = json['available_openings'] unless json['available_openings'].nil?
    self.skills = json['skills'] unless json['skills'].nil?
    self.backgrounds = json['backgrounds'] unless json['backgrounds'].nil?
    self.languages = json['languages'] unless json['languages'].nil?
    self.issues = json['issues'] unless json['issues'].nil?
    self.work_fields = json['work_fields'] unless json['work_fields'].nil?
    self.study_levels = json['study_levels'] unless json['study_levels'].nil?
    self.prefered_locations = json['prefered_locations'] unless json['prefered_locations'].nil?
    self.role_info = json['role_info'] unless json['role_info'].nil?
    self.logistic_info = json['logistic_info'] unless json['logistic_info'].nil?
    self.legal_info = json['legal_info'] unless json['legal_info'].nil?
    self.specifics_info = json['specifics_info'] unless json['specifics_info'].nil?
    self.department = json['department'] unless json['department'].nil?
    self.tm_details = json['tm_details'] unless json['tm_details'].nil?
    self.nps_score = json['nps_score'] unless json['nps_score'].nil?
  end
end

module EXPA::Opportunities
  class << self

  end
end