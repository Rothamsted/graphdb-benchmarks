package uk.ac.rothamsted.rdf.benchmarks.utils;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.lang3.reflect.ConstructorUtils;

/**
 * Utilities related to exception handling.
 *
 * <dl><dt>date</dt><dd>2 Oct 2013</dd></dl>
 * @author Marco Brandizi
 *
 */
public class ExceptionUtils
{
	private ExceptionUtils () {}
	
	/**
	 * Gets the root cause of an exception.
	 */
	public static Throwable getRootCause ( Throwable ex )
	{
		for ( Throwable cause; ; ex = cause )
			if ( ( cause = ex.getCause () ) == null ) return ex;
	}
	
	
	/**
	 * Helper to ease the building of an exception and its message.
	 *  
	 * Builds an exception instance of exType, with the given message template instantiated with
	 * the given paramenters. The message template is passed to {@link String#format(String, Object...)}, 
	 * so you have to use the printf-style rules.
	 * 
	 * The new exception is assigned a cause, if the corresponding parameter is non-null.
	 * 
	 * <b>WARNING</b>: if exType hasn't a proper constructor, either accepting a message + cause, or just a message, 
	 * a constructor with fewer parameters is selected instead (eg, accepting just the message, or without parameters 
	 * at all). This means that you might see exceptions created by this method that DON'T contain a parent cause.
	 * In such cases, you should a different wrapping exception (possibly write code to define a new one, eg, as we've 
	 * done for {@link CausalNumberFormatException}).
	 * 
	 */
	public static <E extends Throwable> E buildEx (
		Class<E> exType, Throwable cause, String messageTemplate, Object... params
	)
	{		
		try
		{
			String msg = String.format ( messageTemplate, params );
						
			// Not all exceptions accept an underlining cause
			if ( cause != null ) {
				Constructor<E> constructor = ConstructorUtils.getMatchingAccessibleConstructor ( exType, String.class, cause.getClass () );
				if ( constructor != null ) return constructor.newInstance ( msg, cause ); 
			}
			
			Constructor<E> constructor = ConstructorUtils.getMatchingAccessibleConstructor ( exType, String.class );
			if ( constructor != null ) return constructor.newInstance ( msg ); 

			// Maybe some don't even accept a message? Unlikely, but just in case. 
			return ConstructorUtils.invokeConstructor ( exType );
		}
		catch ( NoSuchMethodException | SecurityException | InstantiationException 
						| IllegalAccessException | IllegalArgumentException | InvocationTargetException ex )
		{
			throw buildEx ( 
				IllegalArgumentException.class,
				ex,
				"Error while throwing exception for the message \"%s\": %s",
				messageTemplate,
				ex.getMessage ()
			);
		}
	}
	
	/**
	 * Wrapper with no cause.
	 * 
	 */
	public static <E extends Throwable> E buildEx (
		Class<E> exType, String messageTemplate, Object... params
	)
	{
		return buildEx ( exType, null, messageTemplate, params );
	}
	
	/**
	 * Wrapper that uses {@code cause.getClass()} as exception type.
	 */
	@SuppressWarnings ( "unchecked" )
	public static <E extends Throwable> E buildEx (
		E cause, String messageTemplate, Object... params
	) throws E
	{
		return buildEx ( (Class<E>) cause.getClass (), cause, messageTemplate, params );
	}

	
	/**
	 * This calls {@link #buildEx(Class, Throwable, String, Object...)} and then throws the built exception. 
	 * Note that Java will consider this method as throwing checked/unchecked exception code, depending on
	 * the type of E.
	 * 
	 * Note that you cannot always use this to wrap the body of a function, since, if you do for a checked exception,
	 * Java will think that you are not returning any value after the catch clause. 
	 */
	public static <E extends Throwable> void throwEx (
		Class<E> exType, Throwable cause, String messageTemplate, Object... params
	) throws E
	{
		throw buildEx ( exType, cause, messageTemplate, params );
	}	

	/**
	 * A wrapper with no cause.
	 */
	public static <E extends Throwable> void throwEx (
		Class<E> exType, String messageTemplate, Object... params
	) throws E
	{
		throwEx ( exType, null, messageTemplate, params );
	}
	
	/**
	 * Wrapper that uses {@code cause.getClass()} as exception type.
	 */
	@SuppressWarnings ( "unchecked" )
	public static <E extends Throwable> void throwEx (
		E cause, String messageTemplate, Object... params
	) throws E
	{
		throwEx ( ( Class<E> ) cause.getClass (), cause, messageTemplate, params );
	}
}
