import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddBookingComponent } from './bookings/add-booking/add-booking.component';
import { ViewBookingComponent } from './bookings/view-booking/view-booking.component';

const routes: Routes = [

  //path to add
  { path: 'book', component: AddBookingComponent },
  //view bookings
  { path: 'appointments', component: ViewBookingComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
