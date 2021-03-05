#if canImport(Combine) && canImport(UIKit)
  import Combine
  import SwiftUI

  @available(iOS 13, macOS 10.15, tvOS 13, watchOS 6, *)
  extension Scheduler {
    public func animate(
      withDuration duration: TimeInterval,
      delay: TimeInterval = 0,
      options animationOptions: UIView.AnimationOptions = []
    ) -> AnySchedulerOf<Self> {
      AnyScheduler(
        minimumTolerance: { self.minimumTolerance },
        now: { self.now },
        scheduleImmediately: { options, action in
          self.schedule(options: options) {
            UIView.animate(
              withDuration: duration,
              delay: delay,
              options: animationOptions,
              animations: action
            )
          }
        },
        delayed: { date, tolerance, options, action in
          self.schedule(after: date, tolerance: tolerance, options: options) {
            UIView.animate(
              withDuration: duration,
              delay: delay,
              options: animationOptions,
              animations: action
            )
          }
        },
        interval: { date, interval, tolerance, options, action in
          self.schedule(after: date, interval: interval, tolerance: tolerance, options: options) {
            UIView.animate(
              withDuration: duration,
              delay: delay,
              options: animationOptions,
              animations: action
            )
          }
        }
      )
    }

    public func animate(
      withDuration duration: TimeInterval,
      delay: TimeInterval = 0,
      usingSpringWithDamping dampingRatio: CGFloat,
      initialSpringVelocity velocity: CGFloat,
      options animationOptions: UIView.AnimationOptions
    ) -> AnySchedulerOf<Self> {
      AnyScheduler(
        minimumTolerance: { self.minimumTolerance },
        now: { self.now },
        scheduleImmediately: { options, action in
          self.schedule(options: options) {
            UIView.animate(
              withDuration: duration,
              delay: delay,
              usingSpringWithDamping: dampingRatio,
              initialSpringVelocity: velocity,
              options: animationOptions,
              animations: action
            )
          }
        },
        delayed: { date, tolerance, options, action in
          self.schedule(after: date, tolerance: tolerance, options: options) {
            UIView.animate(
              withDuration: duration,
              delay: delay,
              usingSpringWithDamping: dampingRatio,
              initialSpringVelocity: velocity,
              options: animationOptions,
              animations: action
            )
          }
        },
        interval: { date, interval, tolerance, options, action in
          self.schedule(after: date, interval: interval, tolerance: tolerance, options: options) {
            UIView.animate(
              withDuration: duration,
              delay: delay,
              usingSpringWithDamping: dampingRatio,
              initialSpringVelocity: velocity,
              options: animationOptions,
              animations: action
            )
          }
        }
      )
    }
  }
#endif