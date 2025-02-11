import React, { useEffect, useState } from 'react';
import Calendar from 'react-calendar';
import { useDispatch, useSelector } from 'react-redux';
import { useHistory } from 'react-router-dom';
import { CloseSiteContainer } from '../General/HeaderTemplate/CloseSiteContainer';
// eslint-disable-next-line import/no-named-as-default
import { CreateMeeting } from '../../types/Meeting';
import { DiversityIconContainer } from '../General/HeaderTemplate/DiversityIconContainer';
import iconFood from '../../resources/icons/icon-hamburger.svg';
import { createMeetings, loadMeetings } from '../../data/meeting/meetings.actions';

import 'react-calendar/dist/Calendar.css';
import '../../styles/component-styles/addMeeting/selectMeetingData.scss';
import '../../styles/component-styles/addMeeting/dateOverview.scss';
import { dateToString } from '../../utils/date.utils';
import { MeetingTimespan } from './MeetingTimespan';
import { MeetingTimeButton } from '../General/Button/MeetingTimeButton';
import { MeetingsState } from '../../data/meeting/meetings-state.type';
import { AppStoreState } from '../../store/Store';
import { useGetAccountInformation } from '../../hooks/account/account.hook';
import { Button } from '../General/Button/Button';

type SelectMeetingDataProps = {
  // eslint-disable-next-line no-unused-vars
  onAddMeeting(meeting: CreateMeeting): void;
}

export const SelectMeetingData = (props: SelectMeetingDataProps) => {
    const { onAddMeeting } = props;

    const meetingsState: MeetingsState = useSelector((state: AppStoreState) => state.meetings);
    // First date that can be chosen
    const nextDay: Date = new Date();
    nextDay.setDate(nextDay.getDate() + 1);
    nextDay.setUTCHours(0, 0, 0, 0);

    // Last date that can be chosen
    const finalDay: Date = new Date(nextDay);
    finalDay.setDate(finalDay.getDate() + 13);

    const meetingTimespans: MeetingTimespan[] = [
        {
            id: 1,
            fromHour: 12,
            fromMinute: 30,
            toHour: 13,
            toMinute: 0,
        },
        {
            id: 2,
            fromHour: 13,
            fromMinute: 0,
            toHour: 13,
            toMinute: 30,
        },
        {
            id: 3,
            fromHour: 13,
            fromMinute: 30,
            toHour: 14,
            toMinute: 0,
        },
    ];

    const [currentDate, setCurrentDate] = useState<Date>(nextDay);
    const [currentTime, setCurrentTime] = useState<MeetingTimespan>({
        id: 4,
        fromHour: 12,
        fromMinute: 30,
        toHour: 13,
        toMinute: 0,
    });
    const [currentTimeLabel, setCurrentTimeLabel] = useState<string>('12:30 - 13:00');
    const history = useHistory();

    const onDateChange = (date: Date | Date[]) => {
        if (Array.isArray(date)) {
            return;
        }
        setCurrentDate(date);
    };
    const dispatch = useDispatch();
    const { profileId } = useGetAccountInformation();

    useEffect(() => {
        if (meetingsState.status === 'UPDATED') {
            dispatch({ type: 'MEETINGS_LOADING_SUCCEEDED', payload: meetingsState.meetings });
            history.push('/add+meetings/meeting+overview');
        }
        if (meetingsState.status === 'COLLISION') {
            if (meetingsState.meetings) {
                dispatch({ type: 'MEETINGS_LOADING_SUCCEEDED', payload: meetingsState.meetings });
            } else {
                dispatch(loadMeetings(profileId));
            }
            history.push('/meetingAlreadyBooked');
        }
        if (meetingsState.status === 'ERROR') {
            history.push('/bookingError');
        }
    }, [dispatch, profileId, history, meetingsState]);

    const createAndAddMeeting = (): void => {
        const fromDate: Date = new Date(currentDate);
        fromDate.setHours(currentTime.fromHour);
        fromDate.setMinutes(currentTime.fromMinute);

        const currentMeeting: CreateMeeting = {
            fromDateTime: fromDate,
        };
        onAddMeeting(currentMeeting);

        dispatch(createMeetings(currentMeeting, profileId));
    };

    const compareTwoMeetingTimespans = (t1: MeetingTimespan, t2: MeetingTimespan): boolean => (
        t1.fromHour === t2.fromHour
    && t1.fromMinute === t2.fromMinute
    && t1.toHour === t2.toHour
    && t1.toMinute === t2.toMinute);
    return (
        <div className="SelectMeetingData">
            <CloseSiteContainer />
            <DiversityIconContainer title="TERMIN WÄHLEN" />

            <p className="ChooseDate-infoText">An welchem Tag möchtest du dein Diversity Lunch haben?</p>
            <Calendar
                defaultValue={nextDay}
                onChange={onDateChange}
                minDate={nextDay}
                maxDate={finalDay}
            />

            <div className="ChooseTime-segment-control">

                {
                    meetingTimespans.map((meetingTimespan) => (
                        <MeetingTimeButton
                            isActive={compareTwoMeetingTimespans(meetingTimespan, currentTime)}
                            timeSpan={meetingTimespan}
                            onTimeChange={setCurrentTime}
                            setCurrentTimeLabel={setCurrentTimeLabel}
                            key={meetingTimespan.id}
                        />
                    ))
                }

            </div>

            <div className="DateOverview-meeting-container">
                <div className="DateOverview-meeting">
                    <div>
                        <p className="DateOverview-meeting-text">{dateToString(currentDate)}</p>
                        <p className="DateOverview-meeting-text">{currentTimeLabel}</p>
                    </div>
                    <img alt="icon_food" className="DateOverview-meeting-icon" src={iconFood} />
                </div>
            </div>
            <Button label="Termin buchen" onClick={createAndAddMeeting} />
        </div>
    );
};
