package im.actor.model.api.rpc;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.model.droidkit.bser.Bser;
import im.actor.model.droidkit.bser.BserParser;
import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.droidkit.bser.DataInput;
import static im.actor.model.droidkit.bser.Utils.*;
import java.io.IOException;
import im.actor.model.network.parser.*;
import java.util.List;
import java.util.ArrayList;
import im.actor.model.api.*;

public class RequestSendEncryptedMessage extends Request<ResponseSeqDate> {

    public static final int HEADER = 0xe;
    public static RequestSendEncryptedMessage fromBytes(byte[] data) throws IOException {
        return Bser.parse(new RequestSendEncryptedMessage(), data);
    }

    private OutPeer peer;
    private long rid;
    private byte[] encryptedMessage;
    private List<EncryptedAesKey> keys;
    private List<EncryptedAesKey> ownKeys;

    public RequestSendEncryptedMessage(OutPeer peer, long rid, byte[] encryptedMessage, List<EncryptedAesKey> keys, List<EncryptedAesKey> ownKeys) {
        this.peer = peer;
        this.rid = rid;
        this.encryptedMessage = encryptedMessage;
        this.keys = keys;
        this.ownKeys = ownKeys;
    }

    public RequestSendEncryptedMessage() {

    }

    public OutPeer getPeer() {
        return this.peer;
    }

    public long getRid() {
        return this.rid;
    }

    public byte[] getEncryptedMessage() {
        return this.encryptedMessage;
    }

    public List<EncryptedAesKey> getKeys() {
        return this.keys;
    }

    public List<EncryptedAesKey> getOwnKeys() {
        return this.ownKeys;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.peer = values.getObj(1, new OutPeer());
        this.rid = values.getLong(3);
        this.encryptedMessage = values.getBytes(4);
        List<EncryptedAesKey> _keys = new ArrayList<EncryptedAesKey>();
        for (int i = 0; i < values.getRepeatedCount(5); i ++) {
            _keys.add(new EncryptedAesKey());
        }
        this.keys = values.getRepeatedObj(5, _keys);
        List<EncryptedAesKey> _ownKeys = new ArrayList<EncryptedAesKey>();
        for (int i = 0; i < values.getRepeatedCount(6); i ++) {
            _ownKeys.add(new EncryptedAesKey());
        }
        this.ownKeys = values.getRepeatedObj(6, _ownKeys);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.peer == null) {
            throw new IOException();
        }
        writer.writeObject(1, this.peer);
        writer.writeLong(3, this.rid);
        if (this.encryptedMessage == null) {
            throw new IOException();
        }
        writer.writeBytes(4, this.encryptedMessage);
        writer.writeRepeatedObj(5, this.keys);
        writer.writeRepeatedObj(6, this.ownKeys);
    }

    @Override
    public String toString() {
        String res = "rpc SendEncryptedMessage{";
        res += "peer=" + this.peer;
        res += ", rid=" + this.rid;
        res += ", encryptedMessage=" + byteArrayToStringCompact(this.encryptedMessage);
        res += ", keys=" + this.keys.size();
        res += ", ownKeys=" + this.ownKeys.size();
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
