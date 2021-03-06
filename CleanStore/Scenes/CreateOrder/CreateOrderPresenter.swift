//
//  CreateOrderPresenter.swift
//  CleanStore
//
//  Created by Raymond Law on 8/22/15.
//  Copyright (c) 2015 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateOrderPresenterInput
{
  func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
}

protocol CreateOrderPresenterOutput: class
{
  func displayExpirationDate(viewModel: CreateOrder.FormatExpirationDate.ViewModel)
}

class CreateOrderPresenter: CreateOrderPresenterInput
{
  weak var output: CreateOrderPresenterOutput!
  let dateFormatter: NSDateFormatter = {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .ShortStyle
    dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
    return dateFormatter
  }()
  
  // MARK: Expiration date
  
  func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
  {
    let date = dateFormatter.stringFromDate(response.date)
    let viewModel = CreateOrder.FormatExpirationDate.ViewModel(date: date)
    output.displayExpirationDate(viewModel)
  }
}
