package de.brockhausag.diversitylunchspringboot.match.utils;

import de.brockhausag.diversitylunchspringboot.meeting.model.Category;
import de.brockhausag.diversitylunchspringboot.meeting.model.MeetingProposalEntity;

public record Match(MeetingProposalEntity proposalOne,
                    MeetingProposalEntity proposalTwo,
                    int score, Category category) {

}
