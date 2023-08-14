
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CommonModule } from '@angular/common';

@Injectable({
  providedIn: 'root'
})

export class BookingsService {
  private apiUrl = 'https://localhost:44345/api/';

  constructor(private http: HttpClient) { }

  getBookings(): Observable<any> {
    return this.http.get<any>(this.apiUrl+'Bookings/GetBookings');
  }

  getClient(mobile_no:number): Observable<any> {
    return this.http.get<any>(this.apiUrl+'Persons/GetPersonByPhoneNumber/'+mobile_no);
  }
  
}