package info.kyorohiro.hellobeacondiscover;


import net.hetimatan.util.url.PercentEncoder;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.content.Context;

public class HelloBeaconDiscover implements BluetoothAdapter.LeScanCallback {
	private BluetoothManager mBLManager = null;

	public void init(Context context) {
		mBLManager = (BluetoothManager)context.getSystemService(Context.BLUETOOTH_SERVICE);
	}

	public void startDiscover(Context context) {
		if(mBLManager == null) {
			init(context);
		}
		android.util.Log.v("TT","=============startLeScan");
		BluetoothAdapter adapter = mBLManager.getAdapter();
		adapter.startLeScan(this);		
	}

	@Override
	public void onLeScan(BluetoothDevice device, int rssi, byte[] scanRecord) {
		android.util.Log.v("TT","=============onLeScan "
				+"sracnRecord.len="+scanRecord.length+","
				+"rssi="+rssi+","
				+"device="+device.toString());
		PercentEncoder encoder = new PercentEncoder();
		android.util.Log.v("TT","===pe="+encoder.encode(scanRecord));
		
		if(!(scanRecord.length > 30)) {return;}
		StringBuilder builder = new StringBuilder();
		builder.append(Integer.toHexString(0xFF&scanRecord[9]));
		builder.append(Integer.toHexString(0xFF&scanRecord[10]));
		builder.append(Integer.toHexString(0xFF&scanRecord[11]));
		builder.append(Integer.toHexString(0xFF&scanRecord[12]));
		builder.append("-");
		builder.append(Integer.toHexString(0xFF&scanRecord[13]));
		builder.append(Integer.toHexString(0xFF&scanRecord[14]));
		builder.append("-");
		builder.append(Integer.toHexString(0xFF&scanRecord[15]));
		builder.append(Integer.toHexString(0xFF&scanRecord[16]));
		builder.append("-");
		builder.append(Integer.toHexString(0xFF&scanRecord[17]));
		builder.append(Integer.toHexString(0xFF&scanRecord[18]));
		builder.append("-");
		builder.append(Integer.toHexString(0xFF&scanRecord[19]));
		builder.append(Integer.toHexString(0xFF&scanRecord[20]));
		builder.append(Integer.toHexString(0xFF&scanRecord[21]));
		builder.append(Integer.toHexString(0xFF&scanRecord[22]));
		builder.append(Integer.toHexString(0xFF&scanRecord[23]));
		builder.append(Integer.toHexString(0xFF&scanRecord[24]));

		android.util.Log.v("TT","===uuid="+builder.toString());
		int measuredPower = scanRecord[25];
		int major = ((scanRecord[26]&0xFF)<<8) & (scanRecord[27]&0xFF);
		int minor = ((scanRecord[28]&0xFF)<<8) & (scanRecord[29]&0xFF);
		android.util.Log.v("TT","===measuredPower="+measuredPower);
		android.util.Log.v("TT","===major="+major);
		android.util.Log.v("TT","===minor="+minor);

	}
	
}
