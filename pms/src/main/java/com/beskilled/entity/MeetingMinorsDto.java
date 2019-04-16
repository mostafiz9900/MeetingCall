package com.beskilled.entity;


import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;
import java.util.Set;

public class MeetingMinorsDto {
    private Long meetingId;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;
    private String meetingDate;
    private String meetingsubject;
    private String meetingAgenda;
    private String meetingMinors;
    private Set<User> presentOfficers;
    private Organization organization;
    private String remarks;

    public MeetingMinorsDto() {
    }

    public MeetingMinorsDto(Long meetingId, Date startDate, String meetingDate, String meetingsubject, String meetingAgenda, String meetingMinors, Set<User> presentOfficers, Organization organization, String remarks) {
        this.meetingId = meetingId;
        this.startDate = startDate;
        this.meetingDate = meetingDate;
        this.meetingsubject = meetingsubject;
        this.meetingAgenda = meetingAgenda;
        this.meetingMinors = meetingMinors;
        this.presentOfficers = presentOfficers;
        this.organization = organization;
        this.remarks = remarks;
    }

    public Long getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(Long meetingId) {
        this.meetingId = meetingId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getMeetingDate() {
        return meetingDate;
    }

    public void setMeetingDate(String meetingDate) {
        this.meetingDate = meetingDate;
    }

    public String getMeetingsubject() {
        return meetingsubject;
    }

    public void setMeetingsubject(String meetingsubject) {
        this.meetingsubject = meetingsubject;
    }

    public String getMeetingAgenda() {
        return meetingAgenda;
    }

    public void setMeetingAgenda(String meetingAgenda) {
        this.meetingAgenda = meetingAgenda;
    }

    public String getMeetingMinors() {
        return meetingMinors;
    }

    public void setMeetingMinors(String meetingMinors) {
        this.meetingMinors = meetingMinors;
    }

    public Set<User> getPresentOfficers() {
        return presentOfficers;
    }

    public void setPresentOfficers(Set<User> presentOfficers) {
        this.presentOfficers = presentOfficers;
    }

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
