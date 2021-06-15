package uk.ac.rothamsted.rdf.benchmarks.utils;

import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.time.StopWatch;

/**
 * A {@link StopWatch} with extended functionality.
 *
 * <dl><dt>date</dt><dd>9 Apr 2014</dd></dl>
 * @author Marco Brandizi
 *
 */
public class XStopWatch extends StopWatch
{
	/**
	 * If {@link #isSuspended()} invokes {@link #resume()} as usually. If {@link #isStopped()} calls {@link #start()}, 
	 * if neither is true, it means it's already started and hence does nothing.
	 */
	public void resumeOrStart ()
	{
		if ( !isStarted () )
			this.start ();
		else if ( isStopped () ) {
			this.reset ();
			this.start ();
		}
		else if ( isSuspended () ) this.resume ();
		// or, it is already running
	}
	
	/**
	 * Invokes {@link #reset()} and then {@link #start()}, ie, start a new timing session.
	 */
	public void restart () 
	{
		this.reset ();
		this.start ();
	}

	/**
	 * Facility to profile (i.e., to time) a task.
	 * 
	 * @return the time elapsed between before and after {@link Runnable#run() task.run()}.
	 * 
	 * This uses {@link #trackNano(Runnable)}.
	 */
	public static long profileNano ( Runnable task ) 
	{
		return new XStopWatch ().trackNano ( task );
	}

	/**
	 * Wrapper of {@link #profileNano(Runnable)} returning time in ms.
	 */
	public static long profile ( Runnable task ) 
	{
		return TimeUnit.NANOSECONDS.toMillis ( profileNano ( task ) );
	}
	
	/**
	 * This is similar to {@link #profileNano(Runnable)}, but uses the current watch to time the parameter task.
	 * 
	 * At the end of this method, the current watch will be suspended, every new call to this method will 
	 * resume the watch and hence the times measured for multiple tasks are added up.
	 * 
	 * @return the time elapsed since the call to this method and the end of the task parameter.
	 * 
	 * Note that timing a task in a multi-thread context might give wrong results, since here we simply measure 
	 * the time elapsed from start to end, we don't consider the parallelism in between.
	 */
	public long trackNano ( Runnable task )
	{
		long t = this.getNanoTime ();
		if ( !this.isStarted () ) this.start ();
		if ( this.isSuspended () ) this.resume ();
		try {
			task.run ();
			return this.getNanoTime () - t;
		}
		finally {			
			this.suspend ();
		}
	}

	public long track ( Runnable task ) {
		return TimeUnit.NANOSECONDS.toMillis ( trackNano ( task ) );
	}
}
