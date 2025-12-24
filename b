#!/usr/bin/env python3
"""Simple schedule/timetable management system"""

from datetime import datetime, timedelta

class Schedule:
    def __init__(self):
        self.events = []
    
    def add_event(self, name, start_time, duration_hours):
        """Add an event to the schedule"""
        event = {
            'name': name,
            'start_time': start_time,
            'duration': duration_hours,
            'end_time': start_time + timedelta(hours=duration_hours)
        }
        self.events.append(event)
        self.events.sort(key=lambda x: x['start_time'])
    
    def display(self):
        """Display all scheduled events"""
        print("=" * 50)
        print("SCHEDULE / 时间表")
        print("=" * 50)
        for event in self.events:
            print(f"{event['start_time'].strftime('%H:%M')} - {event['end_time'].strftime('%H:%M')}: {event['name']}")
        print("=" * 50)

# Example usage
if __name__ == "__main__":
    schedule = Schedule()
    
    now = datetime.now().replace(hour=9, minute=0, second=0, microsecond=0)
    
    schedule.add_event("Morning Meeting / 早会", now, 1)
    schedule.add_event("Development / 开发", now + timedelta(hours=1), 3)
    schedule.add_event("Lunch Break / 午餐", now + timedelta(hours=4), 1)
    schedule.add_event("Testing / 测试", now + timedelta(hours=5), 2)
    
    schedule.display()